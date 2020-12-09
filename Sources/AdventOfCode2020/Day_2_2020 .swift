//
//  File.swift
//  
//
//  Created by Zofia Drabek on 09/12/2020.
//

import Foundation

struct Day_2_2020 {
    func solve() {
        let path = Bundle.module.path(forResource: "input2", ofType: "txt")
        let sourceString = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        
        let array = sourceString.split(whereSeparator: \.isNewline)
        
        var rulesArray = [(min: Int, max: Int, letter: String, password: String)]()

        for rule in array {
            let row = rule.split { (char) -> Bool in
                if (char == "-") || (char == " ") || (char == ":") {
                    return true
                }
                return false
            }

            rulesArray.append((min: Int(row[0])!, max: Int(row[1])!, letter: String(row[2]), password: String(row[3])))

        }
        
        solveA(array: rulesArray)
        solveB(array: rulesArray)
    }
    
    func solveA(array: [(min: Int, max: Int, letter: String, password: String)]) {
        var counter = 0
        for rule in array {
            let number = rule.password.reduce(0) { (v0, v1) in
                if v1 == rule.letter.first {
                    return v0 + 1
                } else {
                    return v0
                }
            }
            if rule.min <= number, number <= rule.max {
                counter += 1
            }
        }
        print("Solution 2A/2020:", counter)
    }
    
    func solveB(array: [(min: Int, max: Int, letter: String, password: String)]) {
        var counter = 0
        for rule in array {
            if
                let rangeMin = Range(NSMakeRange(rule.min - 1, 1), in: rule.password),
                let rangeMax = Range(NSMakeRange(rule.max - 1, 1), in: rule.password),
                ((rule.password[rangeMin] == rule.letter) != (rule.password[rangeMax] == rule.letter)) {
                counter += 1

            }
        }
        print("Solution 2B/2020:", counter)
    }
}
