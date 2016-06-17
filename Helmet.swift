//
//  Helmet.swift
//  thumbWars
//
//  Created by Robert Masen on 6/17/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation

struct Helmet {
    //itemType
    var name: String
    var Description: String
    //HelmetType
    var magicDmg: Int
    var physicalDmg: Int
    var damageRoll: Dice
    //BoostTYpe
    var physicalDefence: Int
    var magicResistance: Int
    var physicalBonus: Int
    var magicBonus: Int
    var expriation: Date
}
