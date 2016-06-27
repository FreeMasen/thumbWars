//
//  CloudKitHelper.swift
//  thumbWars
//
//  Created by Robert Masen on 6/23/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation
import CloudKit

class CloudKitHelper {
    private var singleton: CloudKitHelper?
    
    func sharedHelper() -> CloudKitHelper {
        if let singleton = self.singleton {
            return singleton
        }
        return CloudKitHelper()
    }
    
    func sendAttackData(attack: Attack) {
        
        
    }
}
