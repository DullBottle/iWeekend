//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

var tree = BinaryTree<Int>.empty

tree.insert(7)
tree.insert(10)
tree.insert(2)
tree.insert(1)
tree.insert(5)
tree.insert(9)

tree.traversePostOrder { print($0) }
















