//
//  Tree+Tips.swift
//  
//
//  Created by MohamedRafat on 11/16/21.
//

import Foundation

// Tree:- is non-linear (heirarchal) DS.
// Each element is a node.

class Node<T> {
    var data: T
    var parent: Node?
    var children: [Node] = []
    
    init(_ data: T){
        self.data = data
    }
    
    func add(_ child: Node) {
        children.add(child)
        child.parent = self
    }
    
    func search(_ element: T) -> Node? {
        if data == element {
            return self
        }
        for child in children{
            if let result = child.search(element){
                return result
            }
        }
        return nil
    }
    
    func printNodeData() -> [String]{
        return ["\(data)"] + children.flatMap({$0.printNodeData()}).map{ "  " + $0 }
    }
    
    func printNodeTree(){
        printNodeData().joined(separator: "\n")
    }
}


/*
    There are variations of tree DS like :-
        - Binary Tree
        - Red-Black Tree
        - R Tree
        - Trie , etc..
 
 
    Example Case:-
       You have a family and you want to store the family members in such a way to preserve their heirarchy.
*/

let family = Node("Grand Parent")
let father = Node("Father")
let mother = Node("Mother")
let child1 = Node("Child 1")
let child2 = Node("Child 2")
family.add(father)
family.add(mother)
father.add(child1)
father.add(child2)

family.printNodeTree()
    
