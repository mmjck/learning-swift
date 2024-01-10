//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

var x = 0.0, y = 0.0, z = 0.0

var welcomeMessage: String
var red, gree, blue: Double

typealias AudioSample = UInt8

var maxAmplitudeFound = AudioSample.min

print(maxAmplitudeFound)

let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible!")
}

let httpError = (404, "Not Found")
print(httpError)

let (statusCode, statusMessage) = httpError
print(statusCode)
print(statusMessage)


let (a, b) = (1, 2)
print(a)
print(b)
//: [Next](@next)

