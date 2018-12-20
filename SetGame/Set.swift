//
//  Set.swift
//  SetGame
//
//  Created by Максим Лихачев on 07/12/2018.
//  Copyright © 2018 Максим Лихачев. All rights reserved.
//

import Foundation

struct Card: Equatable, CustomStringConvertible {
    var description: String {return "\(level)-\(color)-\(fill)-\(figure)"}

    enum Model: Int, CustomStringConvertible{
        var description : String {return String(self.rawValue)}
        var index : Int {return (self.rawValue-1) }

        case model1 = 1
        case model2 = 2
        case model3 = 3

        static var all: [Model]{return [.model1, .model2, .model3]}
    }

    let level : Model
    let color : Model
    let fill : Model
    let figure : Model

    //static func == (lhs: Card, rhs: Card) -> Bool {
    //    return (lhs.level == rhs.level) && (lhs.color == rhs.color) && (lhs.fill == rhs.fill) && (lhs.figure == rhs.figure)
    //}

    static func IsCardsEqual (frst: Card, scnd: Card) -> Bool
    {
        var isEqual : Bool = false
        if(frst.level == scnd.level && frst.figure == scnd.figure && frst.fill == scnd.fill && frst.color == scnd.color)
        { isEqual = true }

        return isEqual;
    }

    //static func == (frst: Card, scnd: Card) -> Bool {return IsEqual(frst: Card, scnd: Card)}


    static func IsSet(cards:[Card]) -> Bool {
        guard cards.count == 3 else {return false}
        let summ = [
            cards.reduce(0,{$1.color.rawValue}),
            cards.reduce(0,{$1.level.rawValue}),
            cards.reduce(0,{$1.fill.rawValue}),
            cards.reduce(0,{$1.figure.rawValue}),
        ]
        return summ.reduce(true, {$0 && ($1 % 3 == 0)})
    }

    /*static func IsSet(cards:[Card]) -> Bool {
        var isSet : Bool = false
        if cards.count == 3 {

            var equals = [2, 2, 2, 2]

            if cards[0].color == cards[1].color && cards[1].color == cards[2].color && cards[0].color == cards[2].color {equals[0] = 1}
            if cards[0].level == cards[1].level && cards[1].level == cards[2].level && cards[0].level == cards[2].level {equals[1] = 1}
            if cards[0].fill == cards[1].fill && cards[1].fill == cards[2].fill  && cards[0].fill == cards[2].fill {equals[2] = 1}
            if cards[0].figure == cards[1].figure && cards[1].figure == cards[2].figure && cards[0].figure == cards[2].figure {equals[3] = 1}

            if cards[0].color != cards[1].color && cards[1].color != cards[2].color && cards[0].color != cards[2].color {equals[0] = 0}
            if cards[0].level != cards[1].level && cards[1].level != cards[2].level && cards[0].level != cards[2].level {equals[1] = 0}
            if cards[0].fill != cards[1].fill && cards[1].fill != cards[2].fill  && cards[0].fill != cards[2].fill {equals[2] = 0}
            if cards[0].figure != cards[1].figure && cards[1].figure != cards[2].figure && cards[0].figure != cards[2].figure {equals[3] = 0}

            var summ : Int = 0
            for i in (0...2) {summ += equals[i]}
            if summ == 3 {isSet = true}
        }
        return isSet
    }*/
}
