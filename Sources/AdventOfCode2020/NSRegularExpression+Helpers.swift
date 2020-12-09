//
//  NSRegularExpression+Helpers.swift
//  AdventOfCode4
//
//  Created by Zofia Drabek on 05/12/2020.
//

import Foundation

extension NSRegularExpression {
    @available(OSX 10.13, *)
    public func captureGroupToInt(in string: String) -> (String) -> Int? {
        return { captureGroupName in
            return self.captureGroupToString(in: string)(captureGroupName)
                .flatMap({ Int($0) })
        }
    }
    @available(OSX 10.13, *)
    public func captureGroupToString(in string: String) -> (String) -> String? {
        return { captureGroupName in
            return self.firstMatch(in: string, range: NSMakeRange(0, string.count))
                .flatMap({ Range($0.range(withName: captureGroupName), in:string) })
                .flatMap({ String(string[$0]) })
        }
    }
}
