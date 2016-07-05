//
//  Items.swift
//  thumbWars
//
//  Created by Robert Masen on 6/16/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation
import CloudKit

protocol ItemType: CloudKitRepresentable {
    var name: String { get }
    var description: String { get }
}

protocol HelmetType: ItemType, BoostType {
    var magicDmg: Int { get }
    var physicalDmg: Int { get }
    var damageRoll: Dice { get }
}

protocol RingType: ItemType, BoostType {
    var physicalDefense: Int { get }
    var magicResistance: Int { get }
}

protocol BoostType: ItemType {
    var healthBonus: Int { get }
    var physicalDefense: Int { get }
    var magicResistance: Int { get }
    var attackBonus: Int { get }
    var physicalDamageBonus: Int { get }
    var magicDamageBonus: Int { get }
    var expiration: Date? { get }
}

extension ItemType {
    var reference: CKReference {
        return CKReference(record: self.record, action: .none)
    }
}
