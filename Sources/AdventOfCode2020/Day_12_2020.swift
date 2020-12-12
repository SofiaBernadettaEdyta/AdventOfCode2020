//
//  File.swift
//  
//
//  Created by Zofia Drabek on 12/12/2020.
//

import Foundation

struct Day_12_2020 {
    func solve() {
        let path = Bundle.module.path(forResource: "input12", ofType: "txt")
        let sourceString = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        
        let array = sourceString.split(whereSeparator: \.isNewline).map { (Move(rawValue: String($0.first!))!, Int(String($0.dropFirst()))!) }
        
        
        solveA(array)
        solveB(array)
    }
    
    func solveA(_ array: [(Move, Int)]) {
        var currrentState = (direction: Direction.e, n: 0, e: 0)
        
        for row in array {
            switch row.0 {
            case .forward:
                switch currrentState.direction {
                case .n:
                    currrentState.n += row.1
                case .s:
                    currrentState.n -= row.1
                case.e:
                    currrentState.e += row.1
                case .w:
                    currrentState.e -= row.1
                }
            case .right:
                switch currrentState.direction {
                case .n:
                    if row.1 == 90 {
                        currrentState.direction = .e
                    } else if row.1 == 180 {
                        currrentState.direction = .s
                    } else if row.1 == 270 {
                        currrentState.direction = .w
                    }
                case .s:
                    if row.1 == 90 {
                        currrentState.direction = .w
                    } else if row.1 == 180 {
                        currrentState.direction = .n
                    } else if row.1 == 270 {
                        currrentState.direction = .e
                    }
                case.e:
                    if row.1 == 90 {
                        currrentState.direction = .s
                    } else if row.1 == 180 {
                        currrentState.direction = .w
                    } else if row.1 == 270 {
                        currrentState.direction = .n
                    }
                case .w:
                    if row.1 == 90 {
                        currrentState.direction = .n
                    } else if row.1 == 180 {
                        currrentState.direction = .e
                    } else if row.1 == 270 {
                        currrentState.direction = .s
                    }
                }
            case .left:
                switch currrentState.direction {
                case .n:
                    if row.1 == 90 {
                        currrentState.direction = .w
                    } else if row.1 == 180 {
                        currrentState.direction = .s
                    } else if row.1 == 270 {
                        currrentState.direction = .e
                    }
                case .s:
                    if row.1 == 90 {
                        currrentState.direction = .e
                    } else if row.1 == 180 {
                        currrentState.direction = .n
                    } else if row.1 == 270 {
                        currrentState.direction = .w
                    }
                case.e:
                    if row.1 == 90 {
                        currrentState.direction = .n
                    } else if row.1 == 180 {
                        currrentState.direction = .w
                    } else if row.1 == 270 {
                        currrentState.direction = .s
                    }
                case .w:
                    if row.1 == 90 {
                        currrentState.direction = .s
                    } else if row.1 == 180 {
                        currrentState.direction = .e
                    } else if row.1 == 270 {
                        currrentState.direction = .n
                    }
                }
            case .north:
                currrentState.n += row.1
            case .south:
                currrentState.n -= row.1
            case .east:
                currrentState.e += row.1
            case .west:
                currrentState.e -= row.1
            }
        }
        
        print("Solution 12A/2020:", abs(currrentState.n) + abs(currrentState.e) )
        
    }
    func solveB(_ array: [(Move, Int)]) {
        var currrentState = (direction: Direction.e, n: 0, e: 0)
        var waypoint = (n: 1, e: 10)
        
        for row in array {
            switch row.0 {
            case .forward:
                currrentState.n += waypoint.n * row.1
                currrentState.e += waypoint.e * row.1
            case .right:
                
                if row.1 == 90 {
                    let n = waypoint.n
                    waypoint.n = -waypoint.e
                    waypoint.e = n
                } else if row.1 == 180 {
                    waypoint.n = -waypoint.n
                    waypoint.e = -waypoint.e
                } else if row.1 == 270 {
                    let n = waypoint.n
                    waypoint.n = waypoint.e
                    waypoint.e = -n
                }
                
            case .left:
                if row.1 == 90 {
                    let n = waypoint.n
                    waypoint.n = waypoint.e
                    waypoint.e = -n
                } else if row.1 == 180 {
                    waypoint.n = -waypoint.n
                    waypoint.e = -waypoint.e
                } else if row.1 == 270 {
                    let n = waypoint.n
                    waypoint.n = -waypoint.e
                    waypoint.e = n
                }
            case .north:
                waypoint.n += row.1
            case .south:
                waypoint.n -= row.1
            case .east:
                waypoint.e += row.1
            case .west:
                waypoint.e -= row.1
            }
        }
        print("Solution 12B/2020:", abs(currrentState.n) + abs(currrentState.e) )
    }
    
    enum Direction: String {
        case n = "N"
        case s = "S"
        case e = "E"
        case w = "W"
    }
    
    enum Move: String {
        case forward = "F"
        case right = "R"
        case left = "L"
        case north = "N"
        case south = "S"
        case east = "E"
        case west = "W"
    }
}
