import UIKit
import Foundation


let serialQueue = DispatchQueue(label: "com.material.serial")

serialQueue.async {
    print("Task 1 started")
    print("Task 1 finished")
}


serialQueue.async {
    print("Task 2 started")
    print("Task 2 finished")
}


let concurrentQueue = DispatchQueue(label: "com.material.concurrent", attributes: .concurrent)


concurrentQueue.async {
    print("Task 1 started")
    print("Task 1 finished")
}
concurrentQueue.async {
    print("Task 2 started")
    print("Task 2 finished")
}
