//
//  Deck.swift
//  SetGame
//
//  Created by Максим Лихачев on 07/12/2018.
//  Copyright © 2018 Максим Лихачев. All rights reserved.
//

import Foundation

struct Deck{
    private(set) var cards = [Card]()

    mutating func draw() -> Card? {
        if cards.count > 0 {return cards.remove(at: cards.count.arc4random )}
        else {return nil}
    }

    init() {
        for level in Card.Model.all{
            for fill in Card.Model.all{
                for color in Card.Model.all{
                    for figure in Card.Model.all{
                        cards.append(Card( level : level, color : color, fill : fill, figure : figure))
                    }
                }
            }
        }
    }
}

extension Int {
    var arc4random : Int {
        if self > 0 {return Int(arc4random_uniform(UInt32(self)))}
        else if self < 0 {return -Int(arc4random_uniform(UInt32(abs(self))))}
        else {return 0}
    }
}

