//
//  Graph+DFS.swift
//  
//
//  Created by MohamedRafat on 11/28/21.
//

import Foundation

/// Graph Traverse :-
/*
        - Depth First Search:- DFS
            - It go deep in each path till finish it then back to explore another path deep and so on.
            - It may find a solution faster without much more search.
            - It may not find a solution.
            - It may stuck in useless paths
 */

class GraphNode<T> {
    var value: T
    var children: [GraphNode]
    var isVisited: Bool
    
    init(_ value: T, _ children: [GraphNode] = [], _ isVisited: Bool = false) {
        self.value = value
        self.children = children
        self.isVisited = isVisited
    }
    
    func addNeighbor(_ node: GraphNode) {
        children.append(node)
        node.children.append(node)
    }
    
    func traverseDFS(_ visit: (GraphNode) -> Void) {
        visit(self)
        children.forEach{ $0.traverseDFS(visit) }
    }
}

// Example
let cityA = GraphNode<Int>(3)
let cityB = GraphNode<Int>(5)
let cityC = GraphNode<Int>(9)
let cityD = GraphNode<Int>(2)
let cityE = GraphNode<Int>(0)
let cityF = GraphNode<Int>(8)

cityA.addNeighbor(cityB)
cityA.addNeighbor(cityC)
cityA.addNeighbor(cityE)
cityE.addNeighbor(cityD)
cityE.addNeighbor(cityF)

cityA.traverseDFS { visitedNode in
    print(visitedNode.value)
}
