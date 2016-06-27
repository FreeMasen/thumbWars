//
//  Ring.swift
//  thumbWars
//
//  Created by Robert Masen on 6/19/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation
import CloudKit

struct Ring: ItemType, RingType, BoostType {
    var id: CKRecordID?
    //itemType
    var name: String
    var description: String
    //RingType
    var physicalDefense: Int
    var magicResistance: Int
    //BoostType
    var healthBonus: Int
    var attackBonus: Int
    var physicalDamageBonus: Int
    var magicDamageBonus: Int
    var expriation: Date?
}

extension Ring: Equatable { }

func ==(lhs: Ring, rhs: Ring) -> Bool {
    if lhs.name == rhs.name { return true }
    return false
}
