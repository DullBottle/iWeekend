import Foundation

public enum BinaryTree<T: Comparable> {
    case empty
    indirect case node(BinaryTree, T, BinaryTree)
    
    public var count: Int {
        switch self {
        case .empty:
            return 0
        case .node(let lhs, _, let rhs):
            return lhs.count + 1 + rhs.count
        }
    }
    
    func search(searchValue: T) -> BinaryTree? {
        switch self {
        case .empty:
            return nil
        case let .node(left, value, right):
            if searchValue == value {
                return self
            }
            
            if searchValue < value {
                return left.search(searchValue: searchValue)
            } else {
                return right.search(searchValue: searchValue)
            }
        }
    }
    
    /// 按顺序遍历
    public func traverseInOrder(progress: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(lhs, value, rhs):
            lhs.traverseInOrder(progress: progress)
            progress(value)
            rhs.traverseInOrder(progress: progress)
        }
    }
    
    public func traversePreOrder(progress: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(lhs, value, rhs):
            progress(value)
            lhs.traverseInOrder(progress: progress)
            rhs.traverseInOrder(progress: progress)
        }
    }
    
    public func traversePostOrder(progress: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(lhs, value, rhs):
            lhs.traverseInOrder(progress: progress)
            rhs.traverseInOrder(progress: progress)
            progress(value)
        }
    }
    
    public mutating func insert(_ element: T) {
        self = insertNewElement(element)
    }
    
    fileprivate func insertNewElement(_ element: T) -> BinaryTree {
        switch self {
        case let .node(lhs, value, rhs):
            if element > value {
                return .node(lhs, value, rhs.insertNewElement(element))
            } else if element < value {
                return .node(lhs.insertNewElement(element), value, rhs)
            }
            return self
        case .empty:
            return .node(.empty, element, .empty)
        }
    }
    
}

extension BinaryTree: CustomStringConvertible {
    public var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value),\n left = [" + left.description + "], right = [" + right.description + "]"
        case .empty:
            return ".empty"
        }
    }
}
