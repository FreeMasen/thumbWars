//
//  Boost.swift
//  thumbWars
//
//  Created by Robert Masen on 6/25/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation
import CloudKit

struct Boost: BoostType {
    var id: CKRecordID?
    var name: String
    var description: String
    var healthBonus: Int
    var physicalDefense: Int
    var magicResistance: Int
    var attackBonus: Int
    var physicalDamageBonus: Int
    var magicDamageBonus: Int
    var expriation: Date?
}

extension Boost: CloudKitRepresentable {
    func asCloudKitRecord() -> CKRecord {
        let record = CKRecord(recordType: "ring")
        record.setObject(name, forKey: "name")
        record.setObject(description, forKey: "description")
        record.setObject(physicalDefense, forKey: "physicalDefense")
        record.setObject(magicResistance, forKey: "magicResistance")
        record.setObject(healthBonus, forKey: "healthBonus")
        record.setObject(attackBonus, forKey: "attackBonus")
        record.setObject(physicalDamageBonus, forKey: "physicalDamageBonus")
        record.setObject(magicDamageBonus, forKey: "magicDamageBonuse")
        record.setObject(expriation, forKey: "expriation")
        return record
    }
}
