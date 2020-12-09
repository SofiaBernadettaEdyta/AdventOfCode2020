//
//  File.swift
//  
//
//  Created by Zofia Drabek on 09/12/2020.
//

import Foundation


struct Day_5_2020 {
    func solve() {
        let path = Bundle.module.path(forResource: "input5", ofType: "txt")
        let sourceString = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        
        let array = sourceString.components(separatedBy: "\n")
                
        var ids = [Int]()
        
        for element in array {
            guard element.count == 10 else { continue }
            let binaryStringRow = element.map { letter -> Character in
                if letter == "B" || letter == "R" {
                    return "1"
                } else if letter == "F" || letter == "L" {
                    return "0"
                } else {
                    return "a"
                }
            }
            let id = Int(String(binaryStringRow), radix: 2)!
            ids.append(id)
        }
        
        ids.sort()
        
        print("Solution 5A/2020:", ids.last!)
        
        let diff = ids.first!
        
        for index in 0..<ids.count {
            if ids[index] != index + diff {
                print("Solution 5B/2020:",ids[index] - 1)
                break
            }
        }
    }
}
