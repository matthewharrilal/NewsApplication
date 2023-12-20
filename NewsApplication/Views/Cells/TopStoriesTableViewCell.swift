//
//  TopStoriesTableViewCell.swift
//  NewsApplication
//
//  Created by Space Wizard on 12/20/23.
//

import Foundation
import UIKit

class TopStoriesTableViewCell: UITableViewCell {
    
    static var cellIdentifier: String {
        String(describing: TopStoriesTableViewCell.self)
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = TopStoriesCollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(TopStoriesCollectionViewCell.self, forCellWithReuseIdentifier: TopStoriesCollectionViewCell.identifier)
        return collectionView
    }()
    
    private let linkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = UIColor(hex: "#6E7787FF")
        label.text = "sometechjournal.co"
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor(hex: "#171A1FFF")
        label.text = "Tech giant announces major investment in renewable energy"
        label.numberOfLines = 0
        return label
    }()
    
    private let timeStampLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "3hr ago"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(hex: "#9095A0FF")
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: UI Related Methods
private extension TopStoriesTableViewCell {
    
    func setup() {
        contentView.addSubviews(collectionView, linkLabel, titleLabel, timeStampLabel)
        
        NSLayoutConstraint.activate([
            // Container View
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            collectionView.heightAnchor.constraint(equalToConstant: 200),
            collectionView.widthAnchor.constraint(equalToConstant: 350),
            
            // Link Label
            linkLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 12),
            linkLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            // Title Label
            titleLabel.topAnchor.constraint(equalTo: linkLabel.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            timeStampLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            timeStampLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            timeStampLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24)
        ])
    }
}


// MARK: UICollectionView Data Source & Delegate Related Methods
extension TopStoriesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TopStoriesCollectionViewCell.identifier,
            for: indexPath
        ) as? TopStoriesCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
}
