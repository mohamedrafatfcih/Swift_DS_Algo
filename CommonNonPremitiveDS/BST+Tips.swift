//
//  BST+Tips.swift
//
//
//  Created by MohamedRafat on 11/19/21.
//

import Foundation

/// Binary Search Tree (BST):-
/*
    Notes:-
        - It is a binary tree.
        - always any node is greater than its left child and less than its right child.
        - Insertion, search and deletion complexity in most cases is O(log n).
        - If all nodes values have some ascending/descending order the BST may end up with a linear structure like Linked List DS. So, the tree operations complexity will be O(n). (worst senario)
 */

class BTNode<T>{
    var value: T
    var parent: BTNode<T>?
    var leftChild: BTNode<T>?
    var rightChild: BTNode<T>?
    
    init(_ value: T, _ leftChild: BTNode? = nil, _ rightChild: BTNode? = nil) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

extension BTNode {
    var minLeftLeaf: BTNode { // It returns the successor if you move right first.
        leftChild?.minLeftLeaf ?? self
    }
}

class BST<T: Comparable & CustomStringConvertible>{
    private var rootNode: BTNode<T>?
    
    func insert(_ value: T) {
        let newNode = BTNode(value)
        if let rNode = rootNode {
            insertNode(rNode, newNode)
        }else{
            rootNode = newNode
        }
    }
    
    private func insertNode(_ parentNode: BTNode<T>, _ newNode: BTNode<T>) {
        if parentNode.value <= newNode.value {
            if let rightChild = parentNode.rightChild {
                insertNode(rightChild, newNode)
            }else {
                parentNode.rightChild = newNode
            }
        }else if parentNode.value > newNode.value {
            if let leftChild = parentNode.leftChild {
                insertNode(leftChild, newNode)
            }else {
                parentNode.leftChild = newNode
            }
        }
    }
    
    func search(_ value: T) -> BTNode<T>? {
        return searchNode(rootNode, value)
    }
    
    private func searchNode(_ currentNode: BTNode<T>?, _ value: T) -> BTNode<T>?{
        
        guard let currentNode = currentNode else {
            return nil
        }
        
        if currentNode.value == value {
            return currentNode
        }else if currentNode.value < value{
            return searchNode(currentNode.rightChild, value)
        }else if  currentNode.value > value {
            return searchNode(currentNode.leftChild, value)
        }
        return nil
    }
    
    func delete(_ value: T){
        rootNode = deleteNode(rootNode, value)
    }
    
    private func deleteNode(_ parentNode: BTNode<T>?, _ value: T) -> BTNode<T>?{
        guard let parentNode = parentNode else {
            return nil
        }
        if parentNode.value == value {
            if parentNode.leftChild == nil && parentNode.rightChild == nil { // Leaf node
                return nil
            }
            if parentNode.leftChild == nil { // only one child in the right
                return parentNode.rightChild
            }
            if parentNode.rightChild == nil { // only one child in the left
                return parentNode.leftChild
            }
                //Desired delet node has two children
            parentNode.value = parentNode.minLeftLeaf.value
            parentNode.rightChild = deleteNode(parentNode.minLeftLeaf, parentNode.value)
        }else if parentNode.value < value {
            parentNode.rightChild = deleteNode(parentNode.rightChild, value)
        }else if parentNode.value > value {
            parentNode.leftChild = deleteNode(parentNode.leftChild, value)
        }
        return parentNode
    }
    
}

/*
    Example Case:-
        Assume you have already decided to store your data in a tree DS and you want to reduce the search time and keep the data in a sorted manner. So, BST is a good tree variant for such case. (But, consider the worst case)
 
 */

let numericBST = BST<Int>()
numericBST.insert(7)
for i in 0...6 {
    numericBST.insert(i)
}

print(numericBST.search(7)?.value)
print(numericBST.delete(7))
print(numericBST.search(7)?.value)



