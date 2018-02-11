import Foundation

open class Node<T: Hashable> {
    
    public var value: T
    public weak var parent: Node<T>?
    public var children: [Node<T>] = []
    
    public init(value: T) {
        self.value = value
    }
    
    public func add(_ child: Node<T>) {
        children.append(child)
        child.parent = self
    }
    
    public func search(value: T) -> Node<T>? {
        if value == self.value {
            return self
        }
        
        for child in children {
            if let found = child.search(value: value) {
                return found
            }
        }
        return nil
    }
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        var text = "\(value)"
        
        if !children.isEmpty {
            text += "{ " + children.map { $0.description }.joined(separator: ", ") + " }"
        }
        
        return text
    }
}

