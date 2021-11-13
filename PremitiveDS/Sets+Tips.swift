//
//  Sets+Tips.swift
//  
//
//  Created by MohamedRafat on 11/13/21.
//

import Foundation

/// Note to remember:- set is an un-ordered list and all its elements must be unique, non-nil and must conform to Hashable protocol.

// Creation of a set can be:-
var mySet1 = Set<Int>()
// Or from an array
var mySet2: Set = [3, 6, 2, 9, 0]

mySet1.insert(5) // Add new element
mySet1.insert(3)

// Safe removal
if let removalSetIndx = mySet2.firstIndex(of: 2){
    mySet2.remove(at: removalSetIndx)
}

/// All math set operation are supported :-
mySet1.union(mySet2)
mySet1.intersection(mySet2)
mySet1.subtracting(mySet2)
mySet1.symmetricDifference(mySet2) // All the two sets but without the intersection elements

/*
    Note:- there is another vesion of each operation method which require the caller set to be non-constant because it will be overwritten.
 
    Ex.
        - setA.formUnion(setB) --> setA elements will be removed and the union of both will be inserted into it.
 */

/// Equality :-
    // The two sets must have the same elements but not require the same order.
let _ = mySet1 == mySet2

///  Membership : -
  /*
        - subset
        - strict subset (subset but not equal)
        - superset
        - strict superset (superset but not equal)
        - disjoint (the two sets have the same values in common).
  */

let _ = mySet1.isSubset(of: mySet2)
let _ = mySet1.isStrictSubset(of: mySet1)
let _ = mySet1.isSuperset(of: mySet2)
let _ = mySet1.isDisjoint(with: mySet2)


