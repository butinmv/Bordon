//
//  + ReusableView.swift
//  Onboarding
//
//  Created by Maxim Butin on 26.02.2022.
//

import UIKit

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
