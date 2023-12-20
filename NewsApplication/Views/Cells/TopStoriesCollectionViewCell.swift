//
//  TopStoriesCollectionViewCell.swift
//  NewsApplication
//
//  Created by Space Wizard on 12/20/23.
//

import Foundation
import UIKit

class TopStoriesCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String {
        String(describing: TopStoriesCollectionViewCell.self)
    }
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.cornerRadius = 4
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension TopStoriesCollectionViewCell {
    
    func setup() {
        contentView.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
