//
//  ThumbType.swift
//  thumbWars
//
//  Created by Robert Masen on 6/16/16.
//  Copyright © 2016 Robert Masen. All rights reserved.
//

import Foundation

protocol Player {
    var level: Int { get }
    var pack: Pack { get set }
}

protocol Attacker {
    var baseAttack: Int { get }
    func attack() -> Attack
}

protocol Defender {
    var baseHealth: Int { get }
    var baseDefense: Int { get }
    var baseResistance: Int { get }
    func defend(against: Attack) -> Defense
}
