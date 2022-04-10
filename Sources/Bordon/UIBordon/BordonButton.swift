//
//  BordonButton.swift
//  Onboarding
//
//  Created by Maxim Butin on 20.02.2022.
//

import UIKit

public struct ButtonModel: Hashable {
    
    let backgroundColor: UIColor?
    let cornerRadius: CGFloat
    let title: TextModel
    
    public init(backgroundColor: UIColor? = .clear,
                cornerRadius: CGFloat = 12,
                title: TextModel) {
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.title = title
    }
}

public class BordonButton: UIControl {
    
    private enum Layout {
        static let height: CGFloat = 48
        static let inset: CGFloat = 16
    }
    
    private let label = BordonLabel()
    
    public override var isHighlighted: Bool {
        didSet {
            updateHighlightedStyle()
        }
    }
    
    public var onTap: (() -> Void)?
    
    // MARK: - Methods
    func prepareStyle(backgroundColor: UIColor? = nil,
                      cornerRadius: CGFloat,
                      title: TextModel? = nil) {
        self.layer.cornerRadius = cornerRadius
        if let backgroundColor = backgroundColor {
            self.backgroundColor = backgroundColor
        }
        if let model = title {
            label.set(model: model)
        }
    }
    
    public func setOnTap(action: (() -> Void)?) {
        onTap = action
    }
    
    // MARK: - Init
    public init(backgroundColor: UIColor? = nil,
                cornerRadius: CGFloat = 0,
                title: TextModel? = nil,
                onTap: (() -> Void)? = nil) {
        self.onTap = onTap
        
        super.init(frame: .zero)
        
        layer.cornerRadius = cornerRadius
        prepareStyle(cornerRadius: cornerRadius, title: title)
        addSubview(label)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.inset),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Layout.inset),
        ])
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap(_ :))))
    }
    
    @available(*, unavailable, message: "init(coder:) has not been implemented")
    public required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}

// MARK: - Animation tap methods
extension BordonButton {
    
    private func updateHighlightedStyle() {
        backgroundColor == .clear
        ? animateHighlighted(on: self)
        : animateHighlighted(on: label)
    }
    
    private func animateHighlighted(on view: UIView) {
        UIView.animate(withDuration: CATransaction.animationDuration() / 2) {
            self.changeHighlighted(on: view)
        }
    }
    
    private func changeHighlighted(on view: UIView) {
        view.alpha = isHighlighted ? 0.6 : 1.0
    }
    
    public override var intrinsicContentSize: CGSize {
        CGSize(width: super.intrinsicContentSize.width, height: Layout.height)
    }
     
    @objc private func didTap(_ sender: UIControl) {
        onTap?()
    }
}

extension BordonButton: Configurable {
    
    public func set(model: ButtonModel) {
        prepareStyle(backgroundColor: model.backgroundColor,
                     cornerRadius: model.cornerRadius,
                     title: model.title)
    }
}
