//
//  + UIStackView.swift
//  UIBordon
//
//  Created by Maxim Butin on 16.02.2022.
//

import UIKit

public extension UIStackView {
    
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { addArrangedSubview($0) }
    }
    
    func removeAllArrangesSubviews() {
        arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}
