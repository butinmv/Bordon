//
//  BordonPageCell.swift
//  Onboarding
//
//  Created by Maxim Butin on 26.02.2022.
//

import UIKit

public class BordonPageCell: UICollectionViewCell, ReusableView {
    
    private enum Constant {
        static let edge: CGFloat = 16
        static let multiplier: CGFloat = 3/5
    }
    
    public let imageView = BordonImageView()
    public let descriptionLabel = BordonLabel()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imageView)
        contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: Constant.multiplier),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constant.edge),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constant.edge),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constant.edge),
            
            descriptionLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1 - Constant.multiplier),
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constant.edge),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constant.edge),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BordonPageCell: Configurable {
    
    public func set(model: Page) {
        imageView.set(model: model.image)
        descriptionLabel.set(model: model.description)
    }
}
