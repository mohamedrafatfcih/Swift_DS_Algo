//
//  BinaryTree+Tips.swift
//
//
//  Created by MohamedRafat on 11/18/21.
//

import Foundation

// Binary Tree (BT):-
    /*
         Notes:-
            - BT has variations like:
                - Full Binary Tree.
                - Perfect Binary Tree.
                - Complete Binary Tree.
                - Balanced Binary Tree.
                - etc...
            - Travese/search types:
                - Pre-Order  -> i.e. (parent, left, right)
                - In-Order -> i.e. (left, parent, right)
                - Post-Order -> i.e. (left, right, node)
     
    */

class BTNode<T> {
    var value: T
    var parent: BTNode<T>?
    var leftChild: BTNode<T>?
    var rightChild: BTNode<T>?

    init(_ value: T, _ left: BTNode? = nil, _ right: BTNode? = nil){
        self.value = value
        self.leftChild = left
        self.rightChild = right
    }
    
    func addChildren(_ leftChild: BTNode<T>?, _ rightChild: BTNode<T>?){
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
    
    func addLeftChild(_ child: BTNode<T>) {
        leftChild = child
    }
    
    func addRightChild(_ child: BTNode<T>) {
        rightChild = child
    }
}

class BT<T> {
    var rootNode: BTNode<T>

    init(_ value: T){
        rootNode = BTNode<T>(value)
    }

    // Pre-Order traverse
    func preOrderTraverse(_ node: BTNode<T>?){
        guard let _ = node else { return }
        print(node!.value)
        preOrderTraverse(node?.leftChild)
        preOrderTraverse(node?.rightChild)
    }

    // In-Order traverse
    func inOrderTraverse(_ node: BTNode<T>?) {
        guard let _ = node else { return }
        inOrderTraverse(node?.leftChild)
        print(node!.value)
        inOrderTraverse(node?.rightChild)
    }

    // Post-Order traverse
    func postOrderTraverse(_ node: BTNode<T>?){
        guard let _ = node else { return }
        postOrderTraverse(node?.leftChild)
        postOrderTraverse(node?.rightChild)
        print(node!.value)
    }
}


/*
    Example
 */
let numericBTree = BT<Int>(5)
let node3 = BTNode(3)
let node99 = BTNode(99)
let node11 = BTNode(11, node3, node99)
let node22 = BTNode(22)
numericBTree.rootNode.addChildren(node11, node22)
numericBTree.inOrderTraverse(node11)



