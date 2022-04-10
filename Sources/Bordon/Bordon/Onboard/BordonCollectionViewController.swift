//
//  BordonCollectionViewController.swift
//  Onboarding
//
//  Created by Maxim Butin on 26.02.2022.
//

import UIKit

public class BordonCollectionViewController: UIViewController {
    
    private let pages: [Page]
    private let bottomModel: BordonBottomViewModel
    private var currentPage = 0 {
        didSet {
            let hideCondition = currentPage == pages.count - 1
            contentBottomView.isHiddeNextButton(hideCondition)
            contentBottomView.isHiddeAdvancedButton(!hideCondition)
        }
    }
    
    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    public lazy var bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentBottomView)
        NSLayoutConstraint.activate([
            contentBottomView.topAnchor.constraint(equalTo: view.topAnchor),
            contentBottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            contentBottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentBottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        return view
    }()
    
    public lazy var contentBottomView: BordonBottomView = {
        let contentView = BordonBottomView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.set(model: bottomModel)
        contentView.didTapNextButton {
            [weak self] in
            
            guard let pages = self?.pages else {
                return
            }
            
            self?.currentPage += 1
            let currentPage = self?.currentPage ?? .zero
            self?.collectionView.scrollToItem(at: IndexPath(item: currentPage,
                                                            section: 0),
                                              at: .right,
                                              animated: true)
            self?.contentBottomView.setIndexForPageControl(currentPage)
        }
        return contentView
    }()
    
    public init(pages: [Page],
         bottomModel: BordonBottomViewModel) {
        self.pages = pages
        self.bottomModel = bottomModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        view = UIView(frame: CGRect.zero)
        view.backgroundColor = .systemGroupedBackground
        view.addSubview(collectionView)
        view.addSubview(bottomView)
        
        collectionView.register(BordonPageCell.self)
        
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor, multiplier: 4/6),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            bottomView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension BordonCollectionViewController: UICollectionViewDelegate {
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        contentBottomView.setIndexForPageControl(currentPage)
    }
}

extension BordonCollectionViewController: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        pages.count
    }
    
    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentPage = pages[indexPath.row]
        let cell: BordonPageCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.set(model: currentPage)
        return cell
    }
}

extension BordonCollectionViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width,
               height: collectionView.frame.height)
    }
}
