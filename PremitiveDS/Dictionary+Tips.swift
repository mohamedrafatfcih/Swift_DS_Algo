//
//  Dictionary+Tips.swift
//  
//
//  Created by MohamedRafat on 11/13/21.
//

import Foundation

/// Heterogeneous dictionary conforms to  Hashable protocol :-  is helpful when converting a json payload.
var heteroDict = [AnyHashable: Any]()
    


 /// Dictionary creation from two arrays :-
var keysArr = [3, 4, 5]
var valuesArr = ["val3", "val 4", "val 5"]
var myDict = Distionary(uniqueKeysWithValues: zip(keysArr, valuesArr)) // No grantuee that myDict will be sorted

// Retrive sorted array from dictionary.
let sortedArr = myDict.sorted({ $0.0 < $1.0 })
 
let sortedKeys = sortedArr.map({ $0.0 }) // get keys only but sorted.
let sortedValues = sortedArr.map({ $0.1 }) // get values only but sorted.

