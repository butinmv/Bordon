//
//  BordonBottomView.swift
//  Onboarding
//
//  Created by Maxim Butin on 26.02.2022.
//

import UIKit

public struct PageControlApperance {
    
    public enum PageControlPosition {
        case top
        case bottom
    }
    
    public enum PageControlStyle {
        case `default`(PageControlPosition)
        case `none`
    }

    
    let numberOfPages: Int
    let currentPageIndicatorTintColor: UIColor?
    let pageIndicatorTintColor: UIColor?
    let pageControlStyle: PageControlStyle
    
    public init(numberOfPages: Int,
                currentPageIndicatorTintColor: UIColor? = .systemGray,
                pageIndicatorTintColor: UIColor? = .systemGray.withAlphaComponent(0.3),
                pageControlStyle: PageControlStyle = .default(.top)) {
        self.numberOfPages = numberOfPages
        self.currentPageIndicatorTintColor = currentPageIndicatorTintColor
        self.pageIndicatorTintColor = pageIndicatorTintColor
        self.pageControlStyle = pageControlStyle
    }
}

public struct BordonBottomViewModel {
    
    let pageControlAppearence: PageControlApperance
    let nextButtonModel: ButtonModel
    let advanceButtonModel: ButtonModel
    
    public init(pageControlAppearence: PageControlApperance,
                nextButtonModel: ButtonModel,
                advanceButtonModel: ButtonModel) {
        self.pageControlAppearence = pageControlAppearence
        self.nextButtonModel = nextButtonModel
        self.advanceButtonModel = advanceButtonModel
    }
}

public class BordonBottomView: UIView {
    
    private enum Layout {
        static let spacing: CGFloat = 8
        static let edge: CGFloat = 16
        static let bottom: CGFloat = 32
    }
    
    private let pageControl = UIPageControl()
    private let nextButton = BordonButton()
    private let advancedButton = BordonButton()
    private lazy var stackView = BordonVerticalStackView(arrangedSubviews: [nextButton, advancedButton],
                                                         spacing: Layout.spacing)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: Layout.edge),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Layout.bottom),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.edge),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Layout.edge),
        ])
        isHiddeNextButton(false)
        isHiddeAdvancedButton(true)
    }
    
    public func didTapNextButton(action: (() -> Void)?) {
        nextButton.onTap = action
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func isHiddeAdvancedButton(_ isHidden: Bool) {
        advancedButton.isHidden = isHidden
    }
    
    public func isHiddeNextButton(_ isHidden: Bool) {
        nextButton.isHidden = isHidden
    }
    
    public func setIndexForPageControl(_ index: Int) {
        pageControl.currentPage = index
    }
}

extension BordonBottomView: Configurable {
    
    public func set(model: BordonBottomViewModel) {
        stackView.removeAllArrangesSubviews()
        switch model.pageControlAppearence.pageControlStyle {
        case .default(.top):
            stackView.addArrangedSubviews([pageControl, nextButton, advancedButton])
        case .default(.bottom):
            stackView.addArrangedSubviews([nextButton, advancedButton, pageControl])
        case .none:
            stackView.addArrangedSubviews([nextButton, advancedButton])
        }
        pageControl.numberOfPages = model.pageControlAppearence.numberOfPages
        pageControl.currentPageIndicatorTintColor = model.pageControlAppearence.currentPageIndicatorTintColor
        pageControl.pageIndicatorTintColor = model.pageControlAppearence.pageIndicatorTintColor
        nextButton.set(model: model.nextButtonModel)
        advancedButton.set(model: model.advanceButtonModel)
    }
}
