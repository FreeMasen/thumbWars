//
//  Items.swift
//  thumbWars
//
//  Created by Robert Masen on 6/16/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation

protocol ItemType {
    var name: String { get }
    var Description: String { get }
}

protocol WeaponType: ItemType {
    var attackType: AttackType { get }
    var magicBonus: Int { get }
    var physicalBonus: Int { get }
    var damageRoll: Dice { get }
}

protocol ArmorType: ItemType {
    var physicalDefence: Int { get }
    var magicResistance: Int { get }
    var damageRoll: Dice { get }
}

protocol AccessoryType: ItemType {
    var physicalDefence: Int { get }
    var magicResistance: Int { get }
    var physicalBonus: Int { get }
    var magicBonus: Int { get }
}
