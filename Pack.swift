//
//  Pack.swift
//  thumbWars
//
//  Created by Robert Masen on 7/1/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation
import CloudKit

class Pack {
    var recordId: CKRecordID {
        return self.record.recordID
    }
    var record: CKRecord {
        didSet {
            CloudKit.database.save(record) { _, error in
                assert(error == nil, "error saving pack: \(error)")
            }
        }
    }
    
    var name: String
    var description: String
    var maxSize: Int
    var items = [ItemType]()
    var references: [CKReference] {
        return items.map { $0.reference }
    }
    
    func append(item: ItemType) {
        if items.count < maxSize {
            items.append(item)
        }
    }
    
    init(with record: CKRecord? = nil) {
        
        if let record = record,
            let name = record.object(forKey: "name") as? String,
            let description = record.object(forKey: "description") as? String,
            let maxSize = record.object(forKey: "maxSize") as? Int,
            let items = record.object(forKey: "items") as? [CKReference] {
                self.record = record
                self.name = name
                self.description = description
                self.maxSize = maxSize
                let operation = CKFetchRecordsOperation()
                operation.recordIDs = items.map { $0.recordID }
                operation.fetchRecordsCompletionBlock = self.contentInBatch
                CloudKit.container.add(operation)
        } else {
            self.record = CKRecord(recordType: "Pack")
            self.name = "Starter pack"
            self.description = "The pack that everyone starts with."
            self.maxSize = 8
        }
    }
    
    func contentInBatch(records: [CKRecordID: CKRecord]?,error: NSError?) {
        if let records = records {
            for (_, record) in records {
                switch record.recordType {
                    case "Ring":
                        if let ring = Ring(with: record) {
                            self.items.append(ring)
                    }
                    case "Helmet":
                        if let helmet = Ring(with: record) {
                            self.items.append(helmet)
                    }
                case "Boost":
                        if let boost = Boost(with: record) {
                            self.items.append(boost)
                    }
                default:
                    assert(true,"unknown record type \(record)")
                }
            }
        }
    }
}
