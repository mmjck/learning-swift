//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

let names = ["Brian", "Jack", "Alex", "Anna"]
let count = names.count

for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}


for name in names[2...] {
    print(name)
}

for name in names[...2] {
    print(name)
}

for name in names[..<2] {
    print(name)
}


let range = ...5

range.contains(5)
range.contains(4)
range.contains(-1)


var threeDoubles = Array(repeating: 0.0, count: 3)
print(threeDoubles)

//: [Next](@next)
