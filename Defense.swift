//
//  Defense.swift
//  thumbWars
//
//  Created by Robert Masen on 6/23/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation
import CloudKit

struct Defense {
    var id: CKRecordID?
    
    private var physicalDamage: Int?
    private var magicDamage: Int?
    var totalDamage: String {
        return "physical: \(physicalDamage ?? 0), magic: \(magicDamage ?? 0)"
    }
    var successful: Bool {
        return physicalDamage == nil &&
            magicDamage == nil
    }
    
    init(physicalDamage: Int?, magicDamage: Int?) {
        self.physicalDamage = physicalDamage
        self.magicDamage = magicDamage
    }
    
}

extension Defense: QueryRepresentable {
    
    func asURLQueryItems() -> [URLQueryItem] {
        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "physicalDamage", value: String(self.physicalDamage)))
        queryItems.append(URLQueryItem(name: "magicDamage", value: String(self.magicDamage)))
        queryItems.append(URLQueryItem(name: "successful", value: String(self.successful)))
        return queryItems
    }
}

//extension Defense: CloudKitRepresentable {
//    func asCloudKitRecord() -> CKRecord {
//        let record = CKRecord(recordType: "defense")
//        record.setObject(self.physicalDamage, forKey: "physicalDamage")
//        record.setObject(self.magicDamage, forKey: "magicDamage")
//        record.setObject(self.successful, forKey: "successful")
//        return record
//    }
//}

extension Defense: Equatable { }

func ==(lhs: Defense, rhs: Defense) -> Bool {
    return lhs.id == rhs.id
}
