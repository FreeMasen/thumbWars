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
