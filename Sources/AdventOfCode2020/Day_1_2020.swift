//
//  File.swift
//  
//
//  Created by Zofia Drabek on 09/12/2020.
//

import Foundation

struct Day_1_2020 {
    
    func solve() {
        let path = Bundle.module.path(forResource: "input1", ofType: "txt")
        let sourceString = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        
        let array = sourceString.split(whereSeparator: \.isNewline).map { Int(String($0))! }
        
        solveA(array: array)
        solveB(array: array)
    }
    
    func solveA(array: [Int]) {
        var differenceSet = Set<Int>()
        var result = 0

        for number in array {
            differenceSet.insert(2020 - number)
            if differenceSet.contains(number) {
                result = number * (2020 - number)
                break
            }
        }
        
        print("Solution 1A/2020:", result)
    }
    
    func solveB(array: [Int]) {
        var newSet = Set<Int>()
        var result = 0

        for numberA in array {
            newSet.insert(2020 - numberA)
            for numberB in array {
                if newSet.contains(numberA + numberB) {
                    result = numberA * numberB * (2020 - (numberA + numberB))
                    break
                }
            }
        }
        
        print("Solution 1B/2020:", result)
    }
}
