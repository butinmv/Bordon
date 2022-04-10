//
//  BordonImageView.swift
//  Onboarding
//
//  Created by Maxim Butin on 20.02.2022.
//

import UIKit

public struct ImageViewModel: Hashable {
    
    let imageName: String?
    let contentMode: UIView.ContentMode
    
    public init(imageName: String?,
                contentMode: UIView.ContentMode = .scaleAspectFit) {
        self.imageName = imageName
        self.contentMode = contentMode
    }
}

public class BordonImageView: UIView {
    
    private let imageView = UIImageView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    @available(*, unavailable, message: "init(coder:) has not been implemented")
    public required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}

extension BordonImageView: Configurable {
    
    public func set(model: ImageViewModel) {
        guard let imageName = model.imageName else {
            fatalError("Not found image in Assets")
        }
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = model.contentMode
    }
}
