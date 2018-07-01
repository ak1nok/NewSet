//
//  Card.swift
//  Set
//
//  Created by ALEXEY ZEMLYANOY on 14/06/2018.
//  Copyright © 2018 ALEXEY ZEMLYANOY. All rights reserved.
//

import Foundation

struct Card {
    
    var isSelected = false
    var isShown = false
    var isSet = false
    var appendString = ""
    
    private static var shape = [String]()
    private static var color = [String]()
    private static var count = [String]()
    private static var shading = [String]()
    
    private static func fillArrayOfNumbersForCards() -> String {
        var appendString = ""
        for index in 0...2  {
            for index2 in 0...2 {
                for index3 in 0...2 {
                    for index4 in 0...2 {
                        Card.shape.append(String(index))
                        Card.color.append(String(index2))
                        Card.count.append(String(index3))
                        Card.shading.append(String(index4))
                    }
                }
            }
        }
        for _ in 0...26
        {
            appendString = shape.removeFirst()
            appendString += color.removeFirst()
            appendString += count.removeFirst()
            appendString += shading.removeFirst()
                    return appendString
        }
        
        return "nil"
    }
    
    init () {
        appendString = Card.fillArrayOfNumbersForCards()
    }
    
}
