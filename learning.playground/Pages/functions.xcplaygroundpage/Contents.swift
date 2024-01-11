//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

func greet(person: String){
    print("Hello, \(person)")
}

func printAndCount(string: String) -> Int{
    print(string)
    return string.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

printWithoutCounting(string: "Value")


func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMax, currentMin)
}


let bounds = minMax(array: [1, 2, 3, 5, 7])
print(bounds)


//: [Next](@next)
