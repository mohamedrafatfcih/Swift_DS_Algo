//
//  Graph+Dijkstra.swift
//
//
//  Created by MohamedRafat on 12/2/21.
//

import Foundation

///  Dijkstra Algorithm:-
/*
        - Notes:-
            - It finds the shortest path between two points.
            - It can be used in:
                    - maps.
                    - telephone networks.
            - Drawbacks:-
                - It may take a lot of time in search.
                - It stuck where there are negative edges.
 
 */

class GraphNode<T> {
    var value: T
    var isVisited: Bool
    var connections: [Connection<T>]
    
    init(_ value: T, _ connections: [Connection<T>] = [], _ isVisited: Bool = false) {
        self.value = value
        self.connections = connections
        self.isVisited = isVisited
    }
    
    func addConnection(_ connection: Connection<T>) {
        self.connections.append(connection)
    }
}

class Connection<T>{
    var toNode: GraphNode<T>
    var cost: Int
    
    init(to node: GraphNode<T>, _ cost: Int){
        assert(cost > 0, "Cost must be positive.")
        self.toNode = node
        self.cost = cost
    }
}

class Path <T>{
    var toNode: GraphNode<T>
    var commulativeCost: Int
    var previousPath: Path?
    
    init(to node: GraphNode<T>, _ connection: Connection<T>? = nil, _ previousPath: Path? = nil){
        if let conn = connection, let prePath = previousPath {
            self.commulativeCost = prePath.commulativeCost + conn.cost
        }else{
            self.commulativeCost = 0
        }
        self.toNode = node
        self.previousPath = previousPath
    }
}

extension Path {
    
    func printPath() -> [String]{
        guard let prePath = previousPath else {
            return [String(describing: self.toNode.value)]
        }
        return prePath.printPath() + [String(describing: self.toNode.value)]
    }
}

class Graph<T> {
    
    static func dijkstraSearch(_ sourceNode: GraphNode<T>, _ destinationNode: GraphNode<T>) -> Path<T>? {
        var pathCollection: [Path<T>] = [] {
            didSet {
                pathCollection.sort { $0.commulativeCost < $1.commulativeCost }
            }
        }
        
        pathCollection.append(Path(to: sourceNode))
        
        while !pathCollection.isEmpty {
            let cheapestPath = pathCollection.removeFirst()
            guard !cheapestPath.toNode.isVisited else{
                continue
            }
            if cheapestPath.toNode === destinationNode{
                return cheapestPath
            }
                
            cheapestPath.toNode.isVisited = true
            for connection in cheapestPath.toNode.connections where !connection.toNode.isVisited{
                pathCollection.append(Path(to: connection.toNode, connection, cheapestPath))
            }
        }
        return nil
    }
}


let nodeA = GraphNode("A")
let nodeB = GraphNode("B")
let nodeC = GraphNode("C")
let nodeD = GraphNode("D")
let nodeE = GraphNode("E")
let nodeF = GraphNode("F")
let nodeG = GraphNode("G")

nodeA.addConnection(Connection<String>(to: nodeB, 2))
nodeA.addConnection(Connection<String>(to: nodeC, 5))
nodeB.addConnection(Connection<String>(to: nodeC, 6))
nodeB.addConnection(Connection<String>(to: nodeD, 1))
nodeB.addConnection(Connection<String>(to: nodeE, 3))
nodeC.addConnection(Connection<String>(to: nodeF, 8))
nodeD.addConnection(Connection<String>(to: nodeE, 4))
nodeE.addConnection(Connection<String>(to: nodeG, 9))
nodeF.addConnection(Connection<String>(to: nodeG, 7))


var gPath = Graph.dijkstraSearch(nodeA, nodeG)
if let foundPath = gPath{
    print("cost \(foundPath.printPath())")
}else {
    print("No path found between nodeA and nodeG.")
}

