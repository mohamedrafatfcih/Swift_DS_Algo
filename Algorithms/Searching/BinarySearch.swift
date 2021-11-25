//
//  BinarySearch.swift
//
//
//  Created by MohamedRafat on 11/25/21.
//

import Foundation


/// Binary Search
/*
        - Notes:-
            - It require the list to be sorted.
            - Complexity is O(log n).
            - It is not better than the linear search when the list is small.
 */

func binarySearch<T: Comparable>(_ inputArray: [T], searchFor value: T) -> Int? {
    var lowIndex = 0
    var highIndex = inputArray.count - 1
    
    while true {
        let midIndex = (lowIndex + highIndex) / 2
        if inputArray[midIndex] == value {
            return midIndex
        }else if lowIndex > highIndex{
            return nil
        }else {
            if inputArray[midIndex] > value {
                highIndex = midIndex - 1
            }else{
                lowIndex = midIndex + 1
            }
        }
        
    }
}

// Example
var inputArr = [0, 2, 2, 4, 5, 7, 9]
if let foundIndex = binarySearch(inputArr, searchFor: 7){
    print("Value found at index at \(foundIndex)")
}else{
    print("This value not value.")
}

