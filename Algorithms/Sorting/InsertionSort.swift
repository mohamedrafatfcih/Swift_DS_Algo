//
//  InsertionSort.swift
//
//
//  Created by MohamedRafat on 11/22/21.
//

import Foundation


/// Insertion Sort:-
/*
        It start from the begining of the array, consider the first element is sorted and other elements not sorted, insert the first unsorted element in its correct place in the sorted part using swap.
 
        - Notes:-
            - Simple implementation.
            - In-place sorting.
            - Time complexity:-
                -  Best case (when array is almost sorted) -> O(n log n).
                - Worst case (when array size is large & elements are reversed) -> O(n^2).
            - Efficient for small size arrays.
 */

func insertionSort<T: Comparable>(_ inputArray: inout [T]) {
    for currentIndex in 1..<inputArray.count {
        for swapIndex in (1...currentIndex).reversed(){
            if inputArray[swapIndex] < inputArray[swapIndex - 1] {
                inputArray.swapAt(swapIndex, swapIndex - 1)
            }else {
                break
            }
        }
    }
}

// Example
var inputArr = [9, 2, 8, 0, 3, 1]
insertionSort(&inputArr)
print(inputArr)


