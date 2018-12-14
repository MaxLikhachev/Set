//
//  Game.swift
//  SetGame
//
//  Created by Максим Лихачев on 13/12/2018.
//  Copyright © 2018 Максим Лихачев. All rights reserved.
//

import Foundation

struct NewGame
{

    private(set) var cardsChoosed = [Card]()
    private(set) var cardsShowed = [Card]()
    private(set) var cardsMatched = [Card]()
    private(set) var cardsSetted = [Card]()

    private var deck = Deck()
    //deckCount == deck.cards.count

    private mutating func TakeThreeMoreCards() -> [Card]?{
        var cardsTreyTaked = [Card]()
        if let card = deck.draw() {
            cardsTreyTaked += [card]
        } else { return nil }

        return cardsTreyTaked
    }

    mutating func DealThreeMoreCards() {
        if let cardsTreyDealed = TakeThreeMoreCards() { cardsShowed += cardsTreyDealed }
    }

    /*
    mutating func RetakeThreeMoreCards() {
        if let cardsTreyRetaked = TakeThreeMoreCards() {
            cardsShowed.replace(elements: cardsMatched, with: cardsTreyRetaked)
        } else {
            cardsShowed.remove(elements: cardsSetted)
        }
        cardsMatched += cardsSetted
        cardsSetted.removeAll()
    }


    mutating func chooseCard(at index: Int){
        let cardsSelected = cardsShowed[index]

        if cardsSetted.count == 2, !cardsSetted.contains(cardsSelected){
            cardsSetted += [cardsSelected]
            isSet = Card.isSet(cardsSetted)
        } else {
            cardsSetted.inOut(element: cardsSelected)
        }
    }
     */
}
