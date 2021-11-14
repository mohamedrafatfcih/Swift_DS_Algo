//
//  DoubleLinkedList.swift
//
//
//  Created by MohamedRafat on 11/14/21.
//

import Foundation

/// Double Linked List

class DoubleNode<T>{
    var value: T
    var next: DoubleNode?
    weak var previous: DoubleNode?
    
    init(_ value: T){
        self.value = value
    }
}

extension DoubleNode: CustomStringConvertible{
    var description: String{
        guard let next = next else{
            return "\(value)"
        }
        return "\(value) -> \(String(describing: next)) "
    }
}

class DoubleLinkedList<T>{
    var head: DoubleNode<T>?
    private var tail: DoubleNode<T>?
    
    func findNode(at position: Int) -> DoubleNode<T>?{
        var currentNode = head
        if position == 0 {
          return currentNode
        }else {
            for _ in 0..<position {
                currentNode = currentNode?.next
            }
            return currentNode
        }
    }
    
    // Add new node at the end of the double linked list.
    func append(_ element: T) {
        let newDNode = DoubleNode(element)
        var h = head
        if let _ = head {
            while let _ = h?.next  {
                h = h?.next
            }
            h?.next = newDNode
            newDNode.previous = h
            newDNode.next = nil
        }else {  // head is nil
            head = newDNode
            tail = newDNode
        }
    }
    
    func insert(_ element: T, at position: Int) {
        let newDNode = DoubleNode(element)
        if position == 0 {
            let h = head
            newDNode.next = h
            h?.previous = newDNode
            head = newDNode
        }else{
            if let _ = head {
                if let nodeAtP = findNode(at: position) { // get node at the desired position
                    newDNode.next = nodeAtP
                    newDNode.previous = nodeAtP.previous
                    
                    nodeAtP.previous?.next = newDNode
                    nodeAtP.previous = newDNode
                    
                }
            }else { // head is nil
                head = newDNode
                tail = newDNode
            }
        }
    }
    
    func remove(_ node: DoubleNode<T>) -> T? {
        let previousNode = node.previous
        let nextNode = node.next
        
        previousNode?.next = nextNode
        nextNode?.previous = previousNode
        
        node.previous = nil
        node.next = nil
        return node.value
    }
    
    // Remove last node (tail)
    func remove() -> T?{
        var h = head
        if let _ = head {
            while h?.next != nil {
                h = h?.next
            }
            defer {
                tail = h?.previous
                h?.previous?.next = nil
                head?.previous = nil
            }
            return h?.value
        }else { // head is nil
            return nil
        }
    }
    
    // Remove node at a position
    func remove(at position: Int) -> T? {
        if position == 0 {
            let h = head
            head = head?.next
            defer {
                h?.next = nil
                h?.previous = nil
                head?.previous = nil
            }
            return h?.value
            
        }else { // move to desired positon
            var currentNode = head
            var prevNode = head
            for _ in 0..<position {
                prevNode = currentNode
                currentNode = currentNode?.next
            }
            prevNode?.next = currentNode?.next
            currentNode?.next?.previous = prevNode
            defer {
                currentNode?.next = nil
                currentNode?.previous = nil
            }
            return currentNode?.value
        }
    }
}

// Extension
extension DoubleLinkedList: CustomStringConvertible {
    var description: String{
        return "\(String(describing: head))"
    }
}

/*
    Example: -
         Assume that you have students in a class and you want to place them. Also, you want from each one to know who is his before and after classmate.
 
*/

class Student: CustomStringConvertible {
    let id: Int
    
    init(_ id: Int) {
        self.id = id
    }
    
    var description: String{
        return String(id)
    }
}

var studentsDLList = DoubleLinkedList<Student>()
studentsDLList.append(Student(6))
studentsDLList.append(Student(9))
studentsDLList.append(Student(1))
studentsDLList.append(Student(4))

studentsDLList.remove(at: 2)
studentsDLList.insert(Student(22), at: 0)
studentsDLList.remove()


print(studentsDLList)

