//
//  ViewController.swift
//  Set
//
//  Created by ALEXEY ZEMLYANOY on 14/06/2018.
//  Copyright © 2018 ALEXEY ZEMLYANOY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        swap12Cards(howMuchCards: 11)
        arrayOfUsedUiButtonsRightNow = 11
    }
    

    //устанавливаем связь
    private var game = SetModel()
    
    @IBAction func touchCard(_ sender: UIButton) {
        
        if let cardNumber = cardButtons.index(of: sender)
        {
            game.chooseCard(at: cardNumber)
        }
        updateFromModelIsSelected()
    }
    

    
    @IBAction func give3CardsMore(_ sender: UIButton) {
        
    }
    
    var arrayOfUsedUiButtonsRightNow = 0
    
    
    @IBOutlet var cardButtons: [UIButton]!
    
    func swap12Cards(howMuchCards: Int) {
        
        for index in 0...howMuchCards {
            
            
            game.arrayOfUsedCards = game.cards.removeFirst()
            //game.cards
            
            var count = game.arrayOfUsedCards
            
            print(game.arrayOfUsedCards)
            print(game.cards.count)

            var array = Array(game.cards[index].appendString)
            //game.cards[index].isShown = true
            
            var arrayShape = ["●", "▲", "■"] //  array[0]
            var arrayColor: [UIColor] = [#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)] // array[1]
            //array[2] ----- количество букв
            //array[3] ----- закраска внутри/либо без закраски/либо полное все
            
            let arrayShapeChoise = arrayShape[Int(String(array[0]))!]
            var mutString = String()
            
            if array[2] == "0" {
                mutString = arrayShapeChoise // создали строку куда положили значение надо создать разные строки
            } else if array[2] == "1" {
                mutString = arrayShapeChoise + "\n" + arrayShapeChoise
            } else if array[2] == "2" {
                mutString = arrayShapeChoise + "\n" + arrayShapeChoise + "\n" + arrayShapeChoise
            }
            
            var setAttribute = [NSAttributedStringKey.foregroundColor: UIColor.blue, NSAttributedStringKey.strokeWidth: 0] as [NSAttributedStringKey : Any]
            
            if array[3] == "0" {
                setAttribute = [ NSAttributedStringKey.foregroundColor: arrayColor[Int(String(array[1]))!], NSAttributedStringKey.strokeWidth: 5]
            } else if array[3] == "1" {
                setAttribute = [ NSAttributedStringKey.foregroundColor: arrayColor[Int(String(array[1]))!].withAlphaComponent(0.20),NSAttributedStringKey.strokeColor:arrayColor[Int(String(array[1]))!], NSAttributedStringKey.strokeWidth: -5]
            } else if array[3] == "2" {
                setAttribute = [ NSAttributedStringKey.foregroundColor: arrayColor[Int(String(array[1]))!], NSAttributedStringKey.strokeWidth: -5]
            }
            
            let nsMutableString = NSMutableAttributedString(string: mutString, attributes: setAttribute)
            cardButtons[index].setAttributedTitle(nsMutableString, for: .normal)
            
        }
    
        updateFromModelIsSelected()
        
    }
    
    func updateFromModelIsSelected() {
        
        for index in 0...11 {
            
            let card = game.cards[index]
            let button = cardButtons[index]
            
            if card.isSelected {
                button.layer.backgroundColor = #colorLiteral(red: 0.8522101684, green: 0.8522101684, blue: 0.8522101684, alpha: 1)
                button.layer.borderWidth = 1.5
                button.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            }
            if !card.isSelected {
                button.layer.backgroundColor = UIColor.white.cgColor
                button.layer.borderWidth = 0.0
            }
            if card.isSet {
                //swap12Cards()
            }
            
        }
    }
    
    
    
    
    
}

