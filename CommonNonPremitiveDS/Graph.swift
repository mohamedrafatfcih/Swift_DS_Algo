//
//  Graph.swift
//  
//
//  Created by MohamedRafat on 11/28/21.
//

import Foundation

/// Graph
/*
        - It is a DS consist of set of vertices and set of edges.
        -  G = {V, E} where V = [v1, v2,....] & E = [e1, e2, ....]
 
        - Notes:-
            - Each node has a value, edge to connect it with its adjacents.
            - Connection can be:
                    - Directed.
                    - Un-directed.
                    - Weighted.
                    - Un-weighted.
            - Graph can vary depend on the number of connections.
                    - Full connected.
                    - Sparse.
                    - etc...
 */

class GraphNode<T> {
    var value: T
    var children: [GraphNode]
    
    init(_ value: T, _ children: [GraphNode] = []){
        self.value = value
        self.children = children
    }
    
    func addNeighbor(_ node: GraphNode) {
        children.append(node)
        node.children.append(self)
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
