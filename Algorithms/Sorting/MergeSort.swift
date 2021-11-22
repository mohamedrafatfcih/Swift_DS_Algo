//
//  MergeSort.swift
//
//
//  Created by MohamedRafat on 11/22/21.
//

import Foundation

/// Merge Sort:-
/*
    - Notes:-
        - It uses divide and conquer appreach.
        - Better for large lists than others (like: buble, insertion, ...).
        - Time complexity is O(n log n).
        - Drawbacks:
                - It go through all steps enven if the array is sorted.
                - Use more memory.
                - Not faster than others in case of small arrays.
 */

func mergeSort<T: Comparable>(_ inputArray: [T]) -> [T] {
    if inputArray.count < 2 {
        return inputArray
    }
    let center = inputArray.count / 2
    return merge(leftPart: mergeSort([T](inputArray[0..<center])), rightPart: mergeSort([T](inputArray[center..<inputArray.count])))
}

func merge<T: Comparable>(leftPart: [T], rightPart: [T]) -> [T] {
    var leftPartIndex = 0
    var rightPartIndex = 0
    var sortedTempArr: [T] = []
    sortedTempArr.reserveCapacity(leftPart.count + rightPart.count)
    
    while leftPartIndex < leftPart.count && rightPartIndex < rightPart.count {
        if leftPart[leftPartIndex] < rightPart[rightPartIndex] {
            sortedTempArr.append(leftPart[leftPartIndex])
            leftPartIndex += 1
        }else if leftPart[leftPartIndex] > rightPart[rightPartIndex] {
            sortedTempArr.append(rightPart[rightPartIndex])
            rightPartIndex += 1
        }else {
            sortedTempArr.append(leftPart[leftPartIndex])
            sortedTempArr.append(rightPart[rightPartIndex])
            leftPartIndex += 1
            rightPartIndex += 1
        }
    }
    sortedTempArr += [T](leftPart[leftPartIndex..<leftPart.count])
    sortedTempArr += [T](rightPart[rightPartIndex..<rightPart.count])
    return sortedTempArr
}


// Example
var inputArr = [8, 2, 6, 1, 0, 3, 6, 9, 2, 0, 4]
let sorteArr = mergeSort(inputArr)
print(sorteArr)

