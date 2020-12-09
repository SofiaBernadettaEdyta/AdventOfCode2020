//
//  File.swift
//  
//
//  Created by Zofia Drabek on 09/12/2020.
//

import Foundation

struct Day_6_2020 {
    func solve() {
        
        let path = Bundle.module.path(forResource: "input6", ofType: "txt")
        let sourceString = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        
        let groups = sourceString.components(separatedBy: "\n\n")

        var counterA = 0

        for group in groups {
            let arr = group.components(separatedBy: "\n").joined()
            let charArr = [Character](arr)
            let set = Set(charArr)
            let groupCount = set.count
        
            counterA += groupCount
        }
        print("Solution 6A/2020:", counterA)
        
        var counterB = 0
        
        for group in groups {
            let arr = group.components(separatedBy: "\n")
            
            var set = Set([Character](arr.first!))
            for personAnswears in arr {
                guard personAnswears.count > 0 else { continue }
                
                let charArr = [Character](personAnswears)
                for char in set {
                    if !charArr.contains(char) {
                        set.remove(char)
                    }
                }
            }
            counterB += set.count
        }
        print("Solution 6B/2020:", counterB)
    }
}
