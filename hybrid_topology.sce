clear;
clc;

// network details
NameOfNetwork = "Hybrid Network Topology";
NumberOfNodes = 29;

// connections
StartingNodesOfConnection = [
1 1 1 1 1 1 1 1 ...
10 11 12 13 14 15 16 17 ...
19 20 21 22 23 24 25 26 27 28 ...
1 18
];

EndingNodesOfConnection = [
2 3 4 5 6 7 8 9 ...
11 12 13 14 15 16 17 18 ...
20 21 22 23 24 25 26 27 28 29 ...
10 19
];

// node coordinates
XCoordinatesOfNodes = [
300 300 250 350 200 400 250 350 300 ...
650 700 750 750 700 650 600 600 650 ...
100 180 260 340 420 500 580 660 740 820 900
];

YCoordinatesOfNodes = [
600 700 650 650 600 600 550 550 500 ...
600 650 600 550 500 500 550 650 700 ...
200 200 200 200 200 200 200 200 200 200 200
];

// create graph
TopologyGraph = NL_G_MakeGraph( ...
NameOfNetwork, ...
NumberOfNodes, ...
StartingNodesOfConnection, ...
EndingNodesOfConnection, ...
XCoordinatesOfNodes, ...
YCoordinatesOfNodes ...
);

// display topology
WindowIndex = 1;
NL_G_ShowGraph(TopologyGraph, WindowIndex);

// show node and edge numbers
WindowIndex = 2;
NL_G_ShowGraphNE(TopologyGraph, WindowIndex);

// colour nodes
WindowIndex = 3;
NodeColor = 5;
BorderThickness = 6;
NodeDiameter = 20;
ListOfNodes = 1:NumberOfNodes;

[graph1, nodeHandles] = NL_G_HighlightNodes( ...
TopologyGraph, ...
ListOfNodes, ...
NodeColor, ...
BorderThickness, ...
NodeDiameter, ...
WindowIndex ...
);

// colour edges
WindowIndex = 4;
EdgeColor = 3;
EdgeWidth = 4;
ListOfEdges = 1:length(StartingNodesOfConnection);

[graph2, edgeHandles] = NL_G_HighlightEdges( ...
TopologyGraph, ...
ListOfEdges, ...
EdgeColor, ...
EdgeWidth, ...
WindowIndex ...
);

// total nodes and edges
[TotalNodes, TotalEdges] = NL_G_GraphSize(TopologyGraph);
disp("Total Nodes = " + string(TotalNodes));
disp("Total Edges = " + string(TotalEdges));

// degree of each node
maxDegree = 0;
maxNode = 0;

for i = 1:NumberOfNodes
EdgeSet = NL_G_EdgesOfNode(TopologyGraph, i);
degree = length(EdgeSet);
disp("Node " + string(i) + " -> Degree = " + string(degree));
if degree > maxDegree then
maxDegree = degree;
maxNode = i;
end
end

disp("Node with maximum edges = " + string(maxNode));
disp("Maximum degree = " + string(maxDegree));
