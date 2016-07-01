//
//  Representable.swift
//  thumbWars
//
//  Created by Robert Masen on 6/25/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation
import CloudKit

protocol QueryRepresentable {
    func asURLQueryItems() -> [URLQueryItem]
}

protocol CloudKitRepresentable {
    var id: CKRecordID? { get }
    
    //init?(from record: CKRecord)
    
    func asCloudKitRecord() -> CKRecord
}
