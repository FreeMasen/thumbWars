//
//  CloudKitRepresentable.swift
//  thumbWars
//
//  Created by Robert Masen on 7/1/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation
import CloudKit

protocol CloudKitRepresentable {
    var reference: CKReference { get }
    var record: CKRecord { get set }
}

