//
//  Card.swift
//  Concentration_Igor
//
//  Created by Игорь Сазонов on 26/04/2019.
//  Copyright © 2019 Игорь Сазонов. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUnigueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUnigueIdentifier()
    }
}
