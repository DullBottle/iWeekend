//: Playground - noun: a place where people can play

import Foundation

public struct Queue<T> {
    
    fileprivate var arr: [T?] = [T?]()
    fileprivate var head = 0
    
    public var isEmpty: Bool {
        return arr.count == head
    }
    
    public var count: Int {
        return arr.count - head
    }
    
    public var front: T? {
        if isEmpty {
            return nil
        }
        return arr[head]
    }
    
    mutating func enqueue(_ element: T) {
        arr.append(element)
    }
    
    mutating func dequeue() -> T? {
        guard head < arr.count, let element = arr[head] else { return nil }
        
        arr[head] = nil
        head += 1
        
        let percent = Double(head) / Double(arr.count)
        if head > 50 && percent > 0.25 {
            arr.removeFirst(head)
            head = 0
        }
        
        return element
    }
}

let password = "A13"
var l = [ "1", "2", "3", "A", "B", "C" ]
var queue = Queue<String>()

func breadthFirstSearch(source: Array<String>) {

    source.forEach { _ = queue.enqueue($0) }
    if let element = queue.front  {
        if element == password {
            print("The password is \(element).")
            return
        }
    }

    let arr = l.map { $0 + queue.front! }
    queue.dequeue()
    breadthFirstSearch(source: arr)
}

breadthFirstSearch(source: l)
















