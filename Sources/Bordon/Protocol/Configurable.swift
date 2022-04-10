//
//  Configurable.swift
//  Protocols
//
//  Created by Maxim Butin on 16.02.2022.
//

import Foundation

public protocol Configurable {
    
    associatedtype Model
    
    func set(model: Model)
}
