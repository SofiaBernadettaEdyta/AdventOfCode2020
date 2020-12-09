//
//  File.swift
//  
//
//  Created by Zofia Drabek on 09/12/2020.
//

import Foundation

@available(OSX 10.13, *)
struct Day_4_2020 {
    
    func solve() {
        let path = Bundle.module.path(forResource: "input4", ofType: "txt")
        let sourceString = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        
        let array = sourceString.components(separatedBy: "\n\n")
        
        let newArray = array.map {
            $0.split { (char) -> Bool in
                if (char == " ") || (char == "\n") {
                    return true
                }
                return false
            }
        }
        
        let documents: [[String: String]] = newArray.map {
            var dictionary = [String: String]()
            for field in $0 {
                let splitedField = field.split(separator: ":")
                let key = String(splitedField[0])
                let value = String(splitedField[1])
                dictionary[key] = value
            }
            return dictionary
        }
        
        solveA(documents: documents)
        solveB(documents: documents)
    }
    
    func solveA(documents: [[String: String]]) {
        var count = 0
        for document in documents {
            if document["byr"] != nil,
               document["iyr"] != nil,
               document["eyr"] != nil,
               document["hgt"] != nil,
               document["hcl"] != nil,
               document["ecl"] != nil,
               document["pid"] != nil {
                count += 1
            }
        }
        
        print("Solution 4A/2020:", count)
    }
    
    func solveB(documents: [[String: String]]) {
        
        var count = 0
        
        for document in documents {
            if let byr = document["byr"],
               let intByr = Int(byr),
               intByr >= 1920, intByr <= 2002,
               let iyr = document["iyr"],
               let intIyr = Int(iyr),
               intIyr >= 2010, intIyr <= 2020,
               let eyr = document["eyr"],
               let intEyr = Int(eyr),
               intEyr >= 2020, intEyr <= 2030,
               let hgt = document["hgt"],
               let hcl = document["hcl"],
               let ecl = document["ecl"],
               let pid = document["pid"] {
                let hgtPattern = "(?<height>[0-9]+)(?<unit>[a-z]+)"
                let regex = try! NSRegularExpression(pattern: hgtPattern)
                
                let captureGroupToString = regex.captureGroupToString(in: hgt)
                let captureGroupToInt = regex.captureGroupToInt(in: hgt)
                
                guard let height = captureGroupToInt("height"),
                      let unit = captureGroupToString("unit") else { continue }
                if unit == "cm" {
                    if height < 150 || height > 193 {
                        continue
                    }
                } else if unit == "in" {
                    if height < 59 || height > 76 {
                        continue
                    }
                } else {
                    continue
                }
                
                guard hcl.count == 7 else { continue }
                
                let hclPattern = "#[{0-9}{a-f}]{6}"
                let hclRegex = try! NSRegularExpression(pattern: hclPattern)
                guard hclRegex.firstMatch(in: hcl, range: NSMakeRange(0, hcl.count)) != nil else { continue }
                
                guard ecl == "amb" || ecl == "blu" || ecl == "brn" || ecl == "grn" || ecl == "gry" || ecl == "hzl" || ecl == "oth" else { continue }
                guard pid.count == 9, Int(pid) != nil else { continue }
                count += 1
            }
        }
        print("Solution 4B/2020:", count)
    }

}
