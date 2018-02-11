//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let beverages = Node(value: "beverages")

let hotBeverage = Node(value: "hot")
let coldBeverage = Node(value: "cold")

let tea = Node(value: "tea")
let coffee = Node(value: "coffee")
let cocoa = Node(value: "cocoa")

let blackTea = Node(value: "black")
let greenTea = Node(value: "green")
let chaiTea = Node(value: "chai")

let soda = Node(value: "soda")
let milk = Node(value: "milk")

let gingerAle = Node(value: "ginger ale")
let bitterLemon = Node(value: "bitter lemon")

beverages.add(hotBeverage)
beverages.add(coldBeverage)

hotBeverage.add(tea)
hotBeverage.add(coffee)
hotBeverage.add(cocoa)

coldBeverage.add(soda)
coldBeverage.add(milk)

tea.add(blackTea)
tea.add(greenTea)
tea.add(chaiTea)

soda.add(gingerAle)
soda.add(bitterLemon)

print(beverages)






