//
//  SelectionSort.swift
//  
//
//  Created by MohamedRafat on 11/21/21.
//

import Foundation

/// Selection Sort:-
/*
    Notes:-
        -  It uses the linear search to find the smallest element.
        - Select the smallest element and swap it in the leftmost unsorted element. then, it consider it as sorted.
        - Simple Implementation.
        - In-place sorting.
        - Worst case -> O(n^2).
        - Not efficient for large arrays.
 */

func selectionSort<T: Comparable>(_ inputArray: inout [T]) {
    for currentIndex in 0..<(inputArray.count - 1) {
        var smallestEleIndex = currentIndex
        for nextIndex in (currentIndex + 1)..<inputArray.count {
            if inputArray[smallestEleIndex] > inputArray[nextIndex]  {
                smallestEleIndex = nextIndex
            }
        }
        if currentIndex != smallestEleIndex {
            inputArray.sawpAt(smallestEleIndex, currentIndex)
        }
    }
}

// Example

var inputArr = [5, 3, 1, 9, 2, 4]
selectionSort(&inputArr)

