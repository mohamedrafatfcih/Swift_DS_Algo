//
//  SingleLinkedList+Tips.swift
//
//
//  Created by MohamedRafat on 11/14/21.
//

import Foundation
import CoreGraphics

/// Single Linked List  :-
    /*
        Notes :-
            - It is linear data structre.
            - Every element is a node.
            - It uses head and tail nodes.
            - Quick insertion and deletion.
            - Adding new element will be through appending or insertion at a position.
            - Deleting element will be from the end (tail) or at a position.
     */


// You have to use classes for linked list because they are reference type which it needed for next reference.
class Node<T> {
    var value: T
    var next: Node?
    
    init(_ value: T){
        self.value = value
    }
}

extension Node: CustomStringConvertible{
    var description: String{
        guard let next = next else{
            return "\(value)"
        }
        return "\(value) -> \(String(describing: next)) "
    }
}

class SingleLinkedList<T>{
    var head: Node<T>?
    var tail: Node<T>?
    
    // Add new node at the end of the linked list.
    func append(_ element: T){
        let newNode = Node(element) // create node
        
        if let t = tail { // start from tail
            t.next = newNode
            tail = newNode
        }else if var h = head {
            while h.next != nil { // move till the end of the list
                h = h.next!
            }
            h.next = newNode
            tail = newNode
        }else { // head is nil
            head = newNode
            tail = newNode
        }
    }
    
    // Add new node at specific position in the linked list.
    func insert(_ element: T, at position: Int){
        let newNode = Node(element)
        if position == 0 { // new node should be the head
            newNode.next = head
            head = newNode
        }else{
            var previousNode = head
            var currentNode = head
            for _ in 0..<position { // move till desired position
                previousNode = currentNode
                currentNode = currentNode?.next
            }
            previousNode?.next = newNode
            newNode.next = currentNode
        }
    }
    
    // Remove node from the end
    func removeLast() -> T?{
        if head?.next == nil {
            defer{
                head = nil
                tail = nil
            }
            return head?.value
        }
        if let _ = head {
            var previousNode = head
            var currentNode = head
            while let _ = currentNode?.next{
                previousNode = currentNode
                currentNode = currentNode?.next
            }
            previousNode?.next = nil
            tail = previousNode
            return currentNode?.value
        }else { // head is nil
            return nil
        }
    }
    
    // Remove node at specific position
    func remove(at position: Int) -> T? {
        if let h = head {
            if position == 0 {
                head = head?.next
                return h.value
            }else { // at specific position
                var previousNode =  head
                var currentNode = head
                for _ in 0..<position {
                    previousNode = currentNode
                    currentNode = currentNode?.next
                }
                previousNode?.next = currentNode?.next
                defer { currentNode?.next = nil }
                return currentNode?.value
            }
        }else { // head is nil
            return nil
        }
    }
}

// Extesion
extension SingleLinkedList: CustomStringConvertible {
    var description: String {
        if let h = head {
            return "\(String(describing: h))"
        }
        return "Empty List"
    }
}

/*
    Example: you have childern in a school class and you want to place them. Also you want to make each child know his next classmate.
 */

class ChildInfo: CustomStringConvertible{
    let id: Int
    init(_ id: Int) {
        self.id = id
    }
    
    var description: String{
        return String(id)
    }
}

var childrenSLList = SingleLinkedList<ChildInfo>()
childrenSLList.append(ChildInfo(3))
childrenSLList.append(ChildInfo(6))
childrenSLList.append(ChildInfo(1))
childrenSLList.append(ChildInfo(9))

childrenSLList.insert(ChildInfo(2), at: 2)

childrenSLList.removeLast() // removes 9

childrenSLList.remove(at: 2) // removes 2

print(childrenSLList)

