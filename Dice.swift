//
//  Dice.swift
//  thumbWars
//
//  Created by Robert Masen on 6/16/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation

struct Attack {
    var physicalDamage = 0
    var magicDamage = 0
    var attackRoll: Int
    init(physicadDmg: Int, magicDmg: Int, roll: Int) {
        self.attackRoll = roll
        self.physicalDamage = physicalDmg
        self.magicDamage = magicDmg
    }
    
    init(from url: URL) {
        let components = url.components!
        for query in components.queryItems {
            if query.name == "physicalDmg" {
                self.physicalDamage = Int(query.value)
            }
            if query.name == "magicDmg" {
                self.magicDamager = Int(query.value)
            }
            if query.name == "attackRoll {
                self.attackRoll = Int(query.value)
            }
        }
    }
}

enum Dice: Int {
    case d2 = 2
    case d3 = 3
    case d4 = 4
    case d6 = 5
    case d8 = 8
    case d10 = 10
    case d12 = 12
    case d20 = 20
    
    func roll() -> Int {
        return random(max: self.rawValue)
    }
    
    func roll(numberOfDice: Int) -> Int {
        var total: Int = 0
        for _ in 1...numberOfDice { total += self.roll() }
        return total
    }
    
    private func random(max: Int) -> Int {
        let unsignedRoll = arc4random_uniform(UInt32(max))
        return Int(unsignedRoll) + 1
    }
    
    var description: String {
        return "1 - \(self.rawValue)"
    }
}
