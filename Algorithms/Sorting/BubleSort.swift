//
//  BubleSort.swift
//
//
//  Created by MohamedRafat on 11/21/21.
//

import Foundation


/// Buble Sort:-
/*
    Notes:-
        - It start from the begining of the array and compare the first two elements, swap them if needed, then select the next two elements and so on till the array end. The largest element will be the last one after the first pass, then, do the other passes till the array become sorted.
        - Simple Implementation.
        - In-place sorting.
        - Best case is when array is sorted, complexity is O(n).
        - Worst case is when array is reversed, complexity is O(n^2).
        - Not efficient for large arrays.
 */

func bubleSort<T: Comparable>(_ inputArray: inout [T]) {
    for endIndex in (1..<inputArray.count).reversed(){
        var isAnyEleSwapped = false
        for currentIndex in 0..<endIndex{
            if inputArray[currentIndex] > inputArray[currentIndex + 1] {
                inputArray.swapAt(currentIndex, currentIndex + 1)
                isAnyEleSwapped = true
            }
        }
        if !isAnyEleSwapped { // No swaps means array is sorted
            return
        }
    }
}

// Example
var arrSort = [3, 2, 5, 9, 7]
bubleSort(&arrSort)
print(arrSort)
