//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let size = args.count
        if args[size - 1] == "count" {
            return size - 1
        } else if args[size - 1] == "avg" {
            var sum : Int = 0
            for index in 0...(size - 2) {
                sum += Int(args[index])!
            }
            return sum / (size - 1)
        } else if args[size - 1] == "fact" {
            var sum : Int = Int(args[0])!
            for index in 1...(size - 2) {
                sum *= Int(args[index])!
            }
            return sum
        } else {
            let operate : String = args[1]
            var numOne : Int! = Int(args[0]) //so that numOne can change in the "%" case
            let numTwo : Int! = Int(args[2])
            switch operate {
                case "+":
                    return numOne + numTwo
                case "-":
                    return numOne - numTwo
                case "/":
                    return numOne / numTwo
                case "*":
                    return numOne * numTwo
                case "%" where numOne < numTwo :
                    return numOne
                case "%" :
                    while numOne >= numTwo {
                        numOne = numOne - numTwo
                    }
                    return numOne
                default:
                    return 1
            }
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

