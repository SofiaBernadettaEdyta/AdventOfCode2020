//
//  File.swift
//  
//
//  Created by Zofia Drabek on 11/12/2020.
//

import Foundation

struct Day_11_2020 {
    func solve() {
        let path = Bundle.module.path(forResource: "input11", ofType: "txt")
        let sourceString = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        
        let array = sourceString.split(whereSeparator: \.isNewline).map { [Character](String($0)) }
        
        solveA(array)
//        solveB(array)
    }
    
    func solveA(_ array: [[Character]]) {
        var previousArray = [[Character]]()
        var currentArray = array
        var newArray = array
        while newArray != previousArray {
            currentArray = newArray
            previousArray = currentArray
            for rowIndex in 0..<currentArray.count {
                for charIndex in 0..<currentArray[rowIndex].count {
                    let char = currentArray[rowIndex][charIndex]
                    let previousIndex = charIndex-1 >= 0 ? charIndex-1 : charIndex
                    let nextIndex = charIndex+1 < currentArray[rowIndex].count ? charIndex+1 : charIndex
                    let previousRow = rowIndex-1 >= 0 ? rowIndex-1 : rowIndex
                    let nextRow = rowIndex+1 < currentArray.count ? rowIndex+1 : rowIndex
                    if char == "L",
                       currentArray[rowIndex][previousIndex] != "#",
                       currentArray[rowIndex][nextIndex] != "#",
                       currentArray[previousRow][charIndex] != "#",
                       currentArray[nextRow][charIndex] != "#",
                       currentArray[nextRow][nextIndex] != "#",
                       currentArray[nextRow][previousIndex] != "#",
                       currentArray[previousRow][previousIndex] != "#",
                       currentArray[previousRow][nextIndex] != "#"
                    {
                        newArray[rowIndex][charIndex] = "#"
                    } else if char == "#" {
                        var count = 0
                        if  charIndex-1 >= 0 {
                            count = currentArray[rowIndex][charIndex-1] == "#" ? count + 1 : count
                            if rowIndex+1 < currentArray.count {
                                count = currentArray[rowIndex+1][charIndex-1] == "#" ? count + 1 : count
                            }
                            if rowIndex-1 >= 0 {
                                count = currentArray[rowIndex-1][charIndex-1] == "#" ? count + 1 : count
                            }
                        }
                        if rowIndex+1 < currentArray.count {
                            count = currentArray[rowIndex+1][charIndex] == "#" ? count + 1 : count
                        }
                        if rowIndex-1 >= 0 {
                            count = currentArray[rowIndex-1][charIndex] == "#" ? count + 1 : count
                        }
                        if charIndex+1 < currentArray[rowIndex].count {
                            count = currentArray[rowIndex][charIndex+1] == "#" ? count + 1 : count
                            if rowIndex+1 < currentArray.count {
                                count = currentArray[rowIndex+1][charIndex+1] == "#" ? count + 1 : count
                            }
                            if rowIndex-1 >= 0 {
                                count = currentArray[rowIndex-1][charIndex+1] == "#" ? count + 1 : count
                            }
                        }
                        if count >= 4 {
                            newArray[rowIndex][charIndex] = "L"
                        }
                    }
                }
            }
            
        }
        var counter = 0
        for row in newArray {
            for char in row {
                if char == "#" {
                    counter += 1
                }
            }
        }
        
        print("Solution 11A/2020:", counter)
    }
//    
//    func solveB(_ array: [[Character]]) {
//        var previousArray = [[Character]]()
//        var currentArray = array
//        var newArray = array
//        while newArray != previousArray {
//            currentArray = newArray
//            previousArray = currentArray
//            for rowIndex in 0..<currentArray.count {
//                for charIndex in 0..<currentArray[rowIndex].count {
//                    let char = currentArray[rowIndex][charIndex]
//                    var previousChar: Character
//                    
//                    let previousIndex = charIndex-1 >= 0 ? charIndex-1 : charIndex
//                    let nextIndex = charIndex+1 < currentArray[rowIndex].count ? charIndex+1 : charIndex
//                    let previousRow = rowIndex-1 >= 0 ? rowIndex-1 : rowIndex
//                    let nextRow = rowIndex+1 < currentArray.count ? rowIndex+1 : rowIndex
//                    if char == "L",
//                       currentArray[rowIndex][previousIndex] != "#",
//                       currentArray[rowIndex][nextIndex] != "#",
//                       currentArray[previousRow][charIndex] != "#",
//                       currentArray[nextRow][charIndex] != "#",
//                       currentArray[nextRow][nextIndex] != "#",
//                       currentArray[nextRow][previousIndex] != "#",
//                       currentArray[previousRow][previousIndex] != "#",
//                       currentArray[previousRow][nextIndex] != "#"
//                    {
//                        newArray[rowIndex][charIndex] = "#"
//                    } else if char == "#" {
//                        var count = 0
//                        if  charIndex-1 >= 0 {
//                            count = currentArray[rowIndex][charIndex-1] == "#" ? count + 1 : count
//                            if rowIndex+1 < currentArray.count {
//                                count = currentArray[rowIndex+1][charIndex-1] == "#" ? count + 1 : count
//                            }
//                            if rowIndex-1 >= 0 {
//                                count = currentArray[rowIndex-1][charIndex-1] == "#" ? count + 1 : count
//                            }
//                        }
//                        if rowIndex+1 < currentArray.count {
//                            count = currentArray[rowIndex+1][charIndex] == "#" ? count + 1 : count
//                        }
//                        if rowIndex-1 >= 0 {
//                            count = currentArray[rowIndex-1][charIndex] == "#" ? count + 1 : count
//                        }
//                        if charIndex+1 < currentArray[rowIndex].count {
//                            count = currentArray[rowIndex][charIndex+1] == "#" ? count + 1 : count
//                            if rowIndex+1 < currentArray.count {
//                                count = currentArray[rowIndex+1][charIndex+1] == "#" ? count + 1 : count
//                            }
//                            if rowIndex-1 >= 0 {
//                                count = currentArray[rowIndex-1][charIndex+1] == "#" ? count + 1 : count
//                            }
//                        }
//                        if count >= 5 {
//                            newArray[rowIndex][charIndex] = "L"
//                        }
//                    }
//                }
//            }
//            
//        }
//        var counter = 0
//        for row in newArray {
//            for char in row {
//                if char == "#" {
//                    counter += 1
//                }
//            }
//        }
//        
//        print("Solution 11B/2020:", counter)
//    }
    
    
}
