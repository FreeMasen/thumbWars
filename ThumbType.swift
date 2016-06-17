//
//  ThumbType.swift
//  thumbWars
//
//  Created by Robert Masen on 6/16/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation

protocol ThumbType {
    var level: Int { get }
    var health: Int { get }
    var baseAttack: Int { get }
    var physicalDefence: Int { get }
    var magicResistance: Int { get }
    var items: [ItemType] { get }
    var helmets: [HelmetType] { get }
    var rings: [RingType] { get }
    var boosts: [BoostType] { get }
    
    func attack(with weapon: HelmetType) -> Attack
    func defend(against: Attack)
}
