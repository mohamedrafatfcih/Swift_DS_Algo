//
//  Stacks+Tips.swift
//  
//
//  Created by MohamedRafat on 11/13/21.
//

import Foundation


// Simple Generic Stack
struct Stack<T>{
    private var items:[T] = []
    
    // Add new element
    mutating func push(_ element: T){
        items.append(element)
    }
    
    // Remove last element
    mutating func pop() -> T? {
        return items.popLast()
    }
    
    // Top element
    mutating func peek() -> T? {
        return items.last
    }
}

// Stack Extension
extension Stack: CustomStringConvertible {
    var description: String {
        return items.description
    }
}

// Example:-

// Assume you want to read set of books and you put them in a reading list. Aslo, you want to keep their reading order to help you to get back quickly to the last read book.

struct Book {
    let title: String
    let author: String
}

var readingList = Stack<Book>()
let book1 = Book(title: "Book 1", author: "Author 1")
readingList.push(book1)
let book2 = Book(title: "Book 2", author: "Author 2")
readingList.push(book2)
let book3 = Book(title: "Book 3", author: "Author 3")
readingList.push(book3)

print(readingList) // works as we defined in the description property

let lastBook = readingList.peek() // Book 3

let _ = readingList.pop() // Book 3
