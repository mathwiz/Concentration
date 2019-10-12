//
//  Card.swift
//  Concentration
//
//  Created by Yohan Lee on 10/12/19.
//  Copyright © 2019 Yohan Lee. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var guid = 0
    
    static func nextId() -> Int {
        guid += 1
        return guid
    }
    
    init() {
        self.identifier = Card.nextId()
    }
}
