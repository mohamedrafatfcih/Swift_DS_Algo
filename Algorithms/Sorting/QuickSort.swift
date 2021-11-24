//
//  QuickSort.swift
//
//
//  Created by MohamedRafat on 11/24/21.
//

import Foundation

/// Quick Sort:-
/*
    - It split the array into two parts depend on an element selected as a pivot. then, it sort the elements less than pivot before pivot position (left side) and the elements greater than pivot after the pivot position (right side).
    - Notes:-
        - It is recursive.
        - Pivot selection strategy:
                - First element.
                - Last element.
                - Random element.
                - Median-of-three. (lowest, center, heighest)
        - In-place sorting.
        - Complexity:-
            - Average case is O(n log n).
            - Worst case is O(n^2).
 */

func quickSort<T: Comparable>(_ inputArray: inout [T], _ lowIndex: Int, _ highIndex: Int){
    if lowIndex < highIndex {
        let pivotIndex = partition(&inputArray, lowIndex, highIndex)
        quickSort(&inputArray, lowIndex, pivotIndex - 1)
        quickSort(&inputArray, pivotIndex + 1, highIndex)
    }
}

func partition<T: Comparable>(_ inputArray: inout [T], _ lowIndex: Int, _ highIndex: Int) -> Int {
    let pivot = getMedian(&inputArray, lowIndex, highIndex)
    var firstMarker = lowIndex
    
    for secondMarker in lowIndex..<highIndex {
        if inputArray[secondMarker] <= pivot {
            inputArray.swapAt(firstMarker, secondMarker)
            firstMarker += 1
        }
    }
    inputArray.swapAt(firstMarker, highIndex)
    return firstMarker
}

// Median-Of-Three strategy to get pivot.
func getMedian<T: Comparable>(_ inputArray: inout [T], _ lowIndex: Int, _ highIndex: Int) -> T {
    let midIndex = lowIndex + (highIndex - lowIndex) / 2
    if inputArray[lowIndex] > inputArray[highIndex] {
        inputArray.swapAt(lowIndex, highIndex)
    }
    if inputArray[midIndex] > inputArray[highIndex] {
        inputArray.swapAt(lowIndex, highIndex)
    }
    inputArray.swapAt(midIndex, highIndex)
    return inputArray[highIndex]
}


// Example
var inputArr = [9, 3, 23, 8, 6, 4, 0, 9]
quickSort(&inputArr, 0, inputArr.count - 1)
print(inputArr)

