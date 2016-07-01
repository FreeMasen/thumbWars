//
//  Helmet.swift
//  thumbWars
//
//  Created by Robert Masen on 6/17/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation
import CloudKit

struct Helmet: HelmetType {
    var id: CKRecordID?
    var record: CKRecord
    //itemType
    var name: String {
        didSet {
            self.record.setObject(name, forKey: "name")
        }
    }
    var description: String {
        didSet {
            self.record.setObject(description, forKey: "description")
        }
    }
    //HelmetType
    var magicDmg: Int {
        didSet {
            self.record.setObject(magicDmg, forKey: "magicDmg")
        }
    }
    var physicalDmg: Int {
        didSet {
            self.record.setObject(physicalDmg, forKey: "physicalDmg")
        }
    }
    var damageRoll: Dice {
        didSet {
            self.record.setObject(damageRoll.rawValue, forKey: "damageRoll")
        }
    }
    //BoostTYpe
    var healthBonus: Int {
        didSet {
            self.record.setObject(healthBonus, forKey: "healthBonus")
        }
    }
    var physicalDefense: Int {
        didSet {
            self.record.setObject(physicalDefense, forKey: "physicalDefense")
        }
    }
    var magicResistance: Int {
        didSet {
            self.record.setObject(magicResistance, forKey: "magicResistance")
        }
    }
    var attackBonus: Int {
        didSet {
            self.record.setObject(attackBonus, forKey: "attackBonus")
        }
    }
    var physicalDamageBonus: Int {
        didSet {
            self.record.setObject(physicalDamageBonus, forKey: "physicalDamageBonus")
        }
    }
    var magicDamageBonus: Int {
        didSet {
            self.record.setObject(magicDamageBonus, forKey: "magicDamageBonus")
        }
    }
    var expriation: Date? {
        didSet {
            self.record.setObject(expriation, forKey: "expriation")
        }
    }
    
    init() {
        self.record = CKRecord(recordType: "Helmet")
        self.name =  "Plain Cap"
        self.description = "very plain steel cap."
        self.magicDmg = 0
        self.physicalDmg = 0
        self.damageRoll = .d6
        self.healthBonus = 0
        self.physicalDefense = 0
        self.magicResistance = 0
        self.attackBonus = 0
        self.physicalDamageBonus = 0
        self.magicDamageBonus = 0
    }
    
    init?(from record: CKRecord) {
        self.record = record
        self.id = record.recordID
        if let name = record.object(forKey: "name") as? String,
            let description = record.object(forKey: "description") as? String,
            let magicDmg = record.object(forKey: "magicDmg") as? Int,
            let physicalDmg = record.object(forKey: "physicalDmg") as? Int,
            let rollNumber = record.object(forKey: "damageRoll") as? Int,
            let damageRoll = Dice(rawValue: rollNumber),
            let healthBonus = record.object(forKey: "healthBonus") as? Int,
            let physicalDefense = record.object(forKey: "physicalDefense") as? Int,
            let magicResistance = record.object(forKey: "magicResistance") as? Int,
            let attackBonus = record.object(forKey: "attackBonus") as? Int,
            let physicalDamageBonus = record.object(forKey: "physicalDamageBonus") as? Int,
            let magicDamageBonus = record.object(forKey: "magicDamageBonus") as? Int {
            
            self.name = name
            self.description = description
            self.magicDmg = magicDmg
            self.physicalDmg = physicalDmg
            self.damageRoll = damageRoll
            self.healthBonus = healthBonus
            self.physicalDefense = physicalDefense
            self.magicResistance = magicResistance
            self.physicalDefense = physicalDefense
            self.attackBonus = attackBonus
            self.physicalDamageBonus = physicalDamageBonus
            self.magicDamageBonus = magicDamageBonus
        } else {
            return nil
        }
        
        
    }
}

extension Helmet: Equatable { }

func ==(lhs: Helmet, rhs: Helmet) -> Bool {
    if lhs.name == rhs.name { return true }
    return false
}

//extension Helmet: CloudKitRepresentable {
//    func asCloudKitRecord() -> CKRecord {
//        let record = CKRecord(recordType: "helmet")
//        record.setObject(name, forKey: "name")
//        record.setObject(description, forKey: "desciption")
//        record.setObject(magicDmg, forKey: "magicDamage")
//        record.setObject(physicalDmg, forKey: "physicalDamage")
//        record.setObject(damageRoll.rawValue, forKey: "damageRoll")
//        record.setObject(healthBonus, forKey: "healthBonus")
//        record.setObject(physicalDefense, forKey: "defense")
//        record.setObject(magicResistance, forKey: "resistance")
//        record.setObject(attackBonus, forKey: "attackBonus")
//        record.setObject(physicalDamageBonus, forKey: "physicalDamageBonus")
//        record.setObject(magicDamageBonus, forKey: "magicDamageBonus")
//        record.setObject(expriation, forKey: "expiration")
//        return record
//    }
//}
