//
//  Trie+Tips.swift
//
//
//  Created by MohamedRafat on 11/17/21.
//

import Foundation

/// Trie:
   /*
       Notes:-
        - Each node store one character.
        - It is better than HashTable DS in case of string prefix matching.
            - No collisions.
            - No hash function.
            - Better worst case.
    */

class TrieNode<K: Hashable> {
    var value: K?
    var parent: TrieNode?
    var children: [K: TrieNode]? = [:]
    var isFinal: Bool = false
    
    init(_ value: K? = nil, _ parent: TrieNode? = nil){
        self.value = value
        self.parent = parent
    }
}

class Trie{
    private let rootNode: TrieNode<Character>
    
    init(){
        rootNode = TrieNode<Character>()
    }
    
    func insert(_ word: String){
        var currentNode = rootNode
        let wordChars = Array(word.lowercased())
        for char in wordChars {
            if let charNode = currentNode.children?[char] {
                currentNode = charNode
            }else {
                let newNode = TrieNode(char, currentNode)
                currentNode.children?[char] = newNode
                currentNode = newNode
            }
        }
        currentNode.isFinal = true
    }
    
    func query(_ word: String) -> Bool{
        var currentNode = rootNode
        let wordChars = Array(word.lowercased())
        for char in wordChars{
            if let charNode = currentNode.children?[char] {
                currentNode = charNode
            }else {
                return false
            }
        }
        return currentNode.isFinal
    }
    
    func remove(_ word: String){
        var currentNode = rootNode
        let wordChars = Array(word.lowercased())
        for char in wordChars{
            if let charNode = currentNode.children?[char] {
                currentNode = charNode
            }
        }
        currentNode.isFinal = false
    }
}

/*
    Example Case:-
        Asumme you have a language consist of number of characters then you want to check if a word or a set of words exists in that language words or not. at that case, we can use a Trie DS to store your language words which enables the fast querying.
 
 */

var languageTrie = Trie()
languageTrie.insert("Aknowleged")
languageTrie.insert("Trie")

languageTrie.query("Trie")
languageTrie.remove("Trie")
languageTrie.query("Trie")



