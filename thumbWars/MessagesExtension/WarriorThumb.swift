//
//  Thumb.swift
//  thumbWars
//
//  Created by Robert Masen on 6/15/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation

class WarriorThumb: ThumbType {
    var level: Int
    var health: Int {
     return level * 10
    }
    var baseAttack: Int {
        return level
    }
    var physicalDefence: Int {
        return 10 + armor.map { $0.physicalDefence }.reduce(0,combine: +)
    }
    var magicResistance: Int {
        return 10 + armor.map { $0.magicResistance }.reduce(0, combine: +)
    }
    var items = [ItemType]()
    var weapons = [WeaponType]()
    var armor = [ArmorType]()
    
    init(level: Int) {
        self.level = level
    }
    
    func attack(with weapon: WeaponType) -> Attack {
        let dmg = weapon.damageRoll.roll() + self.baseAttack
        let roll = Dice.d20.roll() + self.baseAttack
          return Attack(attackType: weapon.attackType, dmg: dmg, roll: roll)
    }
    
    func defend(against: Attack) {
        switch against.attackType {
        case .physical:
            if self.physicalDefence < against.attackRoll {
                self.health -= against.physicalDamage
            }
        case .magic:
            if self.physicalDefence < against.attackRoll {
                self.health -= against.magicDamage
            }
        }
    }
    
}
