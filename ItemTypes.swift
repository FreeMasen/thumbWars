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

protocol HelmetType: ItemType, BoostType {
    var magicDmg: Int { get }
    var physicalDmg: Int { get }
    var damageRoll: Dice { get }
}

protocol RingType: ItemType, BoostType {
    var physicalDefence: Int { get }
    var magicResistance: Int { get }
}

protocol BoostType: ItemType {
    var healthBonus: Int { get }
    var physicalDefence: Int { get }
    var magicResistance: Int { get }
    var attackBonus: Int { get }
    var magicBonus: Int { get }
    var expriation: Date? { get }
}
