//
//  HomeTableViewCell.swift
//  NewsApplication
//
//  Created by Space Wizard on 12/19/23.
//

import Foundation
import UIKit

class HomeTableViewCell: UITableViewCell {
    
    private let linkLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 2
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    private let timeStampLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let thumbnailImageView: UIView = {
        let imageView = UIView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 16
        return imageView
    }()
    
    static var cellIdentifier: String {
        return String(describing: HomeTableViewCell.self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func configure(result: Result?) {
        if let result = result {
            titleLabel.text = result.title
            timeStampLabel.text = "3 hr"
            /*result.link ?? ""*/
            linkLabel.text = "sporty.co"
        }
    }
}

// MARK: UI Related Methods
private extension HomeTableViewCell {
    
    func setup() {
        contentView.addSubviews(
            timeStampLabel,
            titleLabel,
            thumbnailImageView,
            linkLabel,
            dividerView
        )
        
        constrainUIElements()
    }
    
    func constrainUIElements() {
        NSLayoutConstraint.activate([
            // Divider View
            dividerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            dividerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            // Link Label
            linkLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            linkLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            // Title Label
            titleLabel.topAnchor.constraint(equalTo: linkLabel.bottomAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            
            // Timestamp Label
            timeStampLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            timeStampLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            timeStampLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            // Thumbnail Image View
            thumbnailImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            thumbnailImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            thumbnailImageView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            thumbnailImageView.widthAnchor.constraint(equalToConstant: 80),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}
