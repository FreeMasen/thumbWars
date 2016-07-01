//
//  Attack.swift
//  thumbWars
//
//  Created by Robert Masen on 6/23/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation
import CloudKit

struct Attack {
    
    var id: CKRecordID? = nil
    
    var physicalDamage = 0
    var magicDamage = 0
    var attackRoll: Int
    
    init(physicadDmg: Int, magicDmg: Int, roll: Int) {
        self.attackRoll = roll
        self.physicalDamage = physicadDmg
        self.magicDamage = magicDmg

    }
    
    init?(from url: URL) {
        guard let components = NSURLComponents(url: url, resolvingAgainstBaseURL: false),
            let queryItems = components.queryItems else { return nil }
        var physicalDmg: Int?
        var magicDmg: Int?
        var attackRoll: Int?
        for item in queryItems {
            if item.name == "physicalDamage" {
                physicalDmg = Int(item.value!)!
            }
            if item.name == "magicDamage" {
                magicDmg = Int(item.value!)!
            }
            if item.name == "attackRoll" {
                attackRoll = Int(item.value!)!
            }
        }
        self.init(physicadDmg: physicalDmg!, magicDmg: magicDmg!, roll: attackRoll!)
    }
}

extension Attack: QueryRepresentable {
    func asURLQueryItems() -> [URLQueryItem] {
        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "physicalDamage", value: String(physicalDamage)))
        queryItems.append(URLQueryItem(name: "magicDamage", value: String(magicDamage)))
        queryItems.append(URLQueryItem(name: "attackRoll", value: String(attackRoll)))
        return queryItems
    }
}

//extension Attack: CloudKitRepresentable {
//    func asCloudKitRecord() -> CKRecord {
//        let record = CKRecord(recordType: "Attack")
//        record.setObject(self.physicalDamage, forKey: "physicalDamage")
//        record.setObject(self.magicDamage, forKey: "magicDamage")
//        record.setObject(self.attackRoll, forKey: "attackRoll")
//        return record
//    }
//}
