//
//  ReusableView.swift
//  Onboarding
//
//  Created by Maxim Butin on 26.02.2022.
//

import Foundation

protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}
