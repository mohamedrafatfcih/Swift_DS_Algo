//
//  Queue+Tips.swift
//  
//
//  Created by MohamedRafat on 11/14/21.
//

import Foundation

/// Queue :-
struct Queue<T>{
    private var items: [T] = []
    
    // Add new element
    mutating func enqueue(_ element: T) {
        items.append(element)
    }
    
    // Remove/serve first element
    mutating func dequeue() -> T? {
       return items.removeFirst()
    }
    
    // Get the first element
    func peek() -> T? {
        return items.first
    }
    
    mutating func clear(){
        items.removeAll()
    }
    
    // Items count
    var count: Int {
        return items.count
    }
    
    // Queue capacity
    var capacity: Int {
        get { return items.capacity }
        set { items.reserveCapacity(newValue) }
    }
    
    func isEmpty() -> Bool {
        return items.isEmpty()
    }
    
    func isFull() -> Bool {
        return capacity == count
    }
}

/// Queue Extensions :-
/// Add many extensions  as you want.

extension Queue: CustomStringConvertible{
    var description: String {
        return items.description // Customize as you want
    }
}


/// Queue Consumption :-
/*
    
    Example case :-
        Assume you are in metero station and you want to buy a ticket the so, you will go to one of the selling windows and wait at the end of the people line.
 
 */

struct MetroRider{
    let id: Int
}

var peopleLine = Queue<MetroRider>()
peopleLine.enqueue(MetroRider(id: 3))
peopleLine.enqueue(MetroRider(id: 8))
peopleLine.enqueue(MetroRider(id: 5))

let firstBuyer = peopleLine.dequeue() // 3
let _ = peopleLine.isEmpty()



