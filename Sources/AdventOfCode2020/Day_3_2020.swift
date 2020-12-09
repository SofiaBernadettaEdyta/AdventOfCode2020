//
//  File.swift
//  
//
//  Created by Zofia Drabek on 09/12/2020.
//

import Foundation


struct Day_3_2020 {
    
    func solve() {
        let path = Bundle.module.path(forResource: "input3", ofType: "txt")
        let sourceString = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        
        let array = sourceString.split(whereSeparator: \.isNewline).map { [Character](String($0)) }
        
        print("Solution 3A/2020:", calculatNumberOfTrees(mapArray: array, slopes: [(3, 1)]))
        print("Solution 3B/2020:", calculatNumberOfTrees(mapArray: array, slopes: [(1,1), (3,1), (5,1), (7,1), (1,2)]))
    }
    
    func calculatNumberOfTrees(mapArray:  [[Character]], slopes: [(Int, Int)]) -> Int {
        
        var counter = [Int]()

        var currentXPosition = 0
        var currentYPosition = 0
        let numberOfColumns = mapArray[0].count
        var currentSlopeIndex = 0


        for slope in slopes {
            counter.append(0)
            for row in mapArray {
                if (currentYPosition % slope.1) == 0 {
                    if row[currentXPosition] == "#" {
                        counter[currentSlopeIndex] += 1
                    }
                    currentXPosition = (currentXPosition + slope.0) % numberOfColumns
                }
                currentYPosition += 1
            }
            currentXPosition = 0
            currentYPosition = 0
            currentSlopeIndex += 1
        }

        let product = counter.reduce(1,*)

        return product

    }
}



