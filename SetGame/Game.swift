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
    var isSet: Bool?{
        get {
            guard cardsChoosed.count == 3 else {return nil}
            return Card.IsSet(cards: cardsChoosed)
        }
        set {
            if newValue != nil {
                cardsChoosed = cardsMatched
                cardsChoosed.removeAll()
                } else { cardsChoosed.removeAll() }
            }
}

    private(set) var cardsChoosed = [Card]() //cardsTryMatched
    private(set) var cardsShowed = [Card]() //cardsOnTable
    private(set) var cardsMatched = [Card]() //cardsSelected
    private(set) var cardsSetted = [Card]() //cardsRemoved

    private var deck = Deck()
    //deckCount == deck.cards.count

    private mutating func TakeThreeMoreCards() -> [Card]?{
        var cardsTreyTaked = [Card]()
        for _ in 0...2 {
            if let card = deck.draw() {
            cardsTreyTaked += [card]
            } else { return nil }
        }
        return cardsTreyTaked
    }

    mutating func DealThreeMoreCards() {
        if let cardsTreyDealed = TakeThreeMoreCards() { cardsShowed += cardsTreyDealed }
    }

    mutating func RetakeThreeMoreCards() {
        if let cardsTreyRetaked = TakeThreeMoreCards() {
            cardsShowed.replace(elements: cardsChoosed, with: cardsTreyRetaked)
        } else {
            cardsShowed.remove(elements: cardsChoosed)
        }
        cardsSetted += cardsChoosed
        cardsChoosed.removeAll()
    }

    mutating func chooseCard(at index: Int){
        let cardsSelected = cardsShowed[index]

        if cardsSetted.count == 2, !cardsSetted.contains(cardsSelected){
            cardsMatched += cardsChoosed
            isSet = Card.IsSet(cards: cardsMatched)
        } else {
            cardsMatched.inOut(element: cardsSelected)
        }
    }
}
extension Array where Element : Equatable {
    /// переключаем присутствие элемента в массиве:
    /// если нет - включаем, если есть - удаляем
    mutating func inOut(element: Element){
        if let from = self.index(of:element)  {
            self.remove(at: from)
        } else {
            self.append(element)
        }
    }

    mutating func remove(elements: [Element]){
        /// Удаляем массив элементов из массива
        self = self.filter { !elements.contains($0) }
    }

    mutating func replace(elements: [Element], with new: [Element] ){
        /// Заменяем элементы массива на новые
        guard elements.count == new.count else {return}
        for idx in 0..<new.count {
            if let indexMatched = self.index(of: elements[idx]){
                self [indexMatched ] = new[idx]
            }
        }
    }

    func indices(of elements: [Element]) ->[Int]{
        guard self.count >= elements.count, elements.count > 0 else {return []}
        /// Ищем индексы элементов elements у себя - self
        return elements.map{self.index(of: $0)}.compactMap{$0}
    }
}


