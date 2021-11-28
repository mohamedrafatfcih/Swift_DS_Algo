
//
//  Graph+BFS.swift
//
//
//  Created by MohamedRafat on 11/28/21.
//

import Foundation

/// Graph Traverse/Search:-
/*
        - Breadth First Search:- BFS
            - It traverse the graph level by level.
            - It uses a queue for exploring the neighbors nodes.
            - Always find a solution.
            - May be, there are more than one solution.
 */

class GraphNode<T> {
    var value: T
    var children: [GraphNode]
    var isVisited: Bool
    
    init(_ value: T, _ children: [GraphNode] = [], _ isVisited: Bool = false){
        self.value = value
        self.children = children
        self.isVisited = isVisited
    }
    
    func addNeighbor(_ node: GraphNode) {
        children.append(node)
        node.children.append(node)
    }
    
    static func traverseBFS(_ node: GraphNode, _ visit: (GraphNode) -> Void){
        var queue: [GraphNode] = []
        queue.append(node)
        
        while !queue.isEmpty {
            if let nodeToVisit = queue.first {
                visit(nodeToVisit)
                nodeToVisit.isVisited = true
                for child in nodeToVisit.children {
                    if !child.isVisited{
                        queue.append(child)
                    }
                }
            }
            queue.removeFirst()
        }
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

GraphNode.traverseBFS(cityA) { visitedNode in
    print(visitedNode.value)
}

