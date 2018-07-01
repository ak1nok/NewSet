//
//  SetModel.swift
//  Set
//
//  Created by ALEXEY ZEMLYANOY on 14/06/2018.
//  Copyright © 2018 ALEXEY ZEMLYANOY. All rights reserved.
//

import Foundation

extension Array
{
    /** Randomizes the order of an array's elements. */
    mutating func shuffle()
    {
        for _ in 0..<80
        {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}

class SetModel {
    
    var cards = [Card]()
    var arrayOfUsedCards = Card()
    private static var valueOfSelectedCards = 0
    
    func chooseCard(at index: Int) {

        if !cards[index].isSelected, SetModel.valueOfSelectedCards < 3 {
        cards[index].isSelected = true
            SetModel.valueOfSelectedCards += 1
            if SetModel.valueOfSelectedCards == 3 {
                setOfCards()
            }
            
        } else if cards[index].isSelected
            {
            cards[index].isSelected = false
                
            if SetModel.valueOfSelectedCards >= 0 {
            SetModel.valueOfSelectedCards -= 1
            }
              

        }
        
    }
    
    func setOfCards () -> Bool {
        
        var arrayOfCardsAppending = [String]()
        for index in cards.indices {
            if cards[index].isSelected {
                arrayOfCardsAppending.append(cards[index].appendString)
            }
        }
        
        var first = false
        var second = false
        var third = false
        var four = false
        
        var charactersArray = [Character]()
        
        for index in arrayOfCardsAppending {
            print(index)
            for character in index {
                charactersArray.append(character)
            }
        }
        
        if charactersArray[0] == charactersArray[4], charactersArray[8] == charactersArray[4]
        {
            first = true
        }
        if charactersArray[1] == charactersArray[5], charactersArray[9] == charactersArray[5]
        {
            second = true
        }
        if charactersArray[2] == charactersArray[6], charactersArray[10] == charactersArray[6]
        {
            third = true
        }
        if charactersArray[3] == charactersArray[7], charactersArray[11] == charactersArray[7]
        {
            four = true
        }
        
        if charactersArray[0] != charactersArray[4], charactersArray[4] != charactersArray[8], charactersArray[8] != charactersArray[0]
        {
            first = true
        }
        if charactersArray[1] != charactersArray[5], charactersArray[5] != charactersArray[9], charactersArray[9] != charactersArray[1]
        {
            second = true
        }
        if charactersArray[2] != charactersArray[6], charactersArray[6] != charactersArray[10], charactersArray[10] != charactersArray[2]
        {
            third = true
        }
        if charactersArray[3] != charactersArray[7], charactersArray[7] != charactersArray[11], charactersArray[11] != charactersArray[3]
        {
            four = true
        }
        
        
        if first, second, third, four {
            
            for index in cards.indices {
                if cards[index].isSelected {
                    cards[index].isSet = true
                }
            }
            
            return true
        }
        
        return false
    }
    
    
    
    
    init() {
        for _ in 0...80 {
            
            let card = Card()
            cards += [card]
        }
        cards.shuffle()
    }
    
}
