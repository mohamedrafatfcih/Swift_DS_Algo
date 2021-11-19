//
//  BinaryTree+Tips.swift
//  
//
//  Created by MohamedRafat on 11/18/21.
//

import Foundation

// Binary Tree:-

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
}

class BT<T> {
    private let rootNode: BTNode<T>
    
    init(_ value: T){
        rootNode = BTNode<T>(value)
    }
    
    func addChildren(leftChild: BTNode? = nil, rightChild: BTNode? = nil) {
        rootNode.leftChild = leftChild
        rootNode.rightChild = rightChild
    }
    
    // Pre-Order traverse
    func preOrderTraverse(_ node: BTNode?){
        guard var node = node else {
            node = self
        }
        print(node?.value)
        preOrderTraverse(node?.leftChild)
        preOrderTraverse(node?.rightChild)
    }
    
    // In-Order traverse
    func inOrderTraverse(_ node: BTNode?) {
        guard var node = node else {
            node = self
        }
        inOrderTraverse(node?.leftChild)
        print(node?.value)
        inOrderTraverse(node?.rightChild)
    }
    
    // Post-Order traverse
    func postOrderTraverse(_ node: BTNode?){
        guard var node = node else {
            node = self
        }
        postOrderTraverse(node?.leftChild)
        postOrderTraverse(node?.rightChild)
        print(node?.value)
    }
}



let numericBTree = BT<Int>(5)
let node3 = BTNode(3)
let node99 = BTNode(99)
let node11 = BTNode(11, node3, node99)
let node22 = BTNode(22)
numericBTree.addChildren(rightChild: node22)
numericBTree.inOrderTraverse()
