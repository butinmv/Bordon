//
//  BordonLabel.swift
//  UIBordon
//
//  Created by Maxim Butin on 16.02.2022.
//

import UIKit

public struct TextModel: Hashable {
    let text: String?
    let font: UIFont
    let textColor: UIColor
    
    public init(text: String?,
                font: UIFont = UIFont.preferredFont(forTextStyle: .title1),
                textColor: UIColor = .lightGray) {
        self.text = text
        self.font = font
        self.textColor = textColor
    }
}

public class BordonLabel: UILabel {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        numberOfLines = 0
        textAlignment = .center
        lineBreakMode = .byWordWrapping
        textColor = .black
    }
    
    @available(*, unavailable, message: "init(coder:) has not been implemented")
    public required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}

extension BordonLabel: Configurable {
    
    public func set(model: TextModel) {
        text = model.text
        font = model.font
        textColor = model.textColor
    }
}
