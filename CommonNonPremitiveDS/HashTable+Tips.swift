//
//  HashTable+Tips.swift
//
//
//  Created by MohamedRafat on 11/16/21.
//

import Foundation

/// HashTable:-

class HashElement<K: Hashable, V> {
    var key: K
    var value: V?
    
    init(_ key: K, _ value: V){
        self.key = key
        self.value = value
    }
}

class HashTable<K: Hashable, V> {
    typealias Bucket = [HashElement<K, V>]
    var buckets: [Bucket]
    
    init(_ size: Int){
        assert(size > 0)
        buckets = Array<Bucket>(repeatElement([], count: size))
    }
    
    subscript(_ key: K) -> V? {
        get {
            return getValue(for: key)
        }
        set {
            if let value = newValue {
                update(value, forKey: key)
            }else {
                removeValue(forKey: key)
            }
        }
    }
    
    // Hash function
    func hash(forKey key: K) -> Int {
        var divisor = 0
        for k in String(describing: key).unicodeScalars {
            divisor += abs(Int(k.hashValue))
        }
        return abs(divisor) % buckets.count
    }
    
    func getValue(for key: K) -> V? {
        let hEleIndex = hash(forKey: key)
        for hEle in buckets[hEleIndex] {
            if hEle.key == key{
                return hEle.value
            }
        }
        return nil
    }
    
    func update(_ value: V, forKey key: K) -> V? {
        let hEleIndex = hash(forKey: key)
        for (i, hEle) in buckets[hEleIndex].enumerated() {
            if hEle.key == key {
                buckets[hEleIndex][i].value = value
                return hEle.value
            }
        }
        buckets[hEleIndex].append(HashElement(key, value))
        return nil
    }
    
    func removeValue(forKey key: K) -> V?{
        let hEleIndex = hash(forKey: key)
        for (i, hEle) in buckets[hEleIndex].enumerated(){
            if hEle.key == key {
                buckets[hEleIndex].remove(at: i)
                return hEle.value
            }
        }
        return nil
    }
}


/*
    Example Case: -
        Assume that you have a list of employees and the search operation is very important for you (because it the most frequant operation in your system). So, you decided to store them in such away that gives you O(1) in search. at that time you can use the HashTable DS.
 
 */

struct Employee{
    let id: Int
}

let employeeHashTable = HashTable<Int, Employee>(3)
employeeHashTable[2] = Employee(id: 2)
employeeHashTable[5] = Employee(id: 5)
employeeHashTable[4] = Employee(id: 4)
employeeHashTable[8] = Employee(id: 8)

