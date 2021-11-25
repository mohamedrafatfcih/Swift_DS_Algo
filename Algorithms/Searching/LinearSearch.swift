//
//  LinearSearch.swift
//  
//
//  Created by MohamedRafat on 11/25/21.
//

import Foundation

/// Linear Search:-
/*
     - Notes:-
        - Efficient memory.
        - Works good for sorted and unsorted lists.
        - Complexity is O(n). So, it  is efficient for small list but not better when list go larger.
 */

func linearSearch<T: Comparable>(_ inputArray: [T], searchFor value: T) -> Int? {
    for i in 0..<inputArray.count {
        if inputArray[i] == value{
            return i
        }
    }
    return nil
}
