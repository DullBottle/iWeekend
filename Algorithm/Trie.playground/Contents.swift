//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

class Trie {
    typealias Node = TrieNode<Character>
    fileprivate let root: Node
    
    init() {
        root = Node()
    }
    
    public func insert(word: String) {
        
        guard !word.isEmpty else { return }
        
        var currentNode = root
        
        let characters = Array(word.lowercased().characters)
        var currentIndex = 0
        
        while currentIndex < characters.count {
            
            let character = characters[currentIndex]
            
            if let child = currentNode.children[character] {
                currentNode = child
            } else {
                currentNode.add(character)
                currentNode = currentNode.children[character]!
            }
            
            currentIndex += 1
        }
        
        if currentIndex == characters.count {
            currentNode.isTerminating = true
        }
    }
    
    public func contains(word: String) -> Bool {
        
        guard !word.isEmpty else { return false }
        
        var currentNode = root
        
        let characters = Array(word.lowercased().characters)
        var currentIndex = 0
        
        while currentIndex < characters.count,
            let child = currentNode.children[characters[currentIndex]]
        {
            currentIndex += 1
            currentNode = child
        }
        
        if currentIndex == characters.count && currentNode.isTerminating {
            return true
        } else {
            return false
        }
    }
}

class TrieNode<T: Hashable> {
    
    var isTerminating = false
    var value: T?
    weak var parent: TrieNode?
    var children: [T: TrieNode] = [:]
    
    init(value: T? = nil, parent: TrieNode? = nil) {
        self.value = value
        self.parent = parent
    }
    
    public func add(_ child: T) {
        
        guard children[child] == nil else { return }
        
        children[child] = TrieNode(value: child, parent: self)
    }
}

let trie = Trie()

trie.insert(word: "cute")
trie.contains(word: "cute") // true

trie.contains(word: "cut") // false
trie.insert(word: "cut")
trie.contains(word: "cut") // true













