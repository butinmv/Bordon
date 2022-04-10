//
//  BordonVerticalStackView.swift
//  UIBordon
//
//  Created by Maxim Butin on 16.02.2022.
//

import UIKit

public class BordonVerticalStackView: UIStackView {
    
    private enum Layout {
        static let spacing: CGFloat = 16
    }
    
    public init(arrangedSubviews: [UIView] = [],
                spacing: CGFloat = .zero,
                distribution: UIStackView.Distribution = .fill,
                alignment: UIStackView.Alignment = .fill) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
        self.addArrangedSubviews(arrangedSubviews)
        axis = .vertical
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
