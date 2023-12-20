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
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.cornerRadius = 4
        return view
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: UI Related Methods
private extension TopStoriesTableViewCell {
    
    func setup() {
        contentView.addSubviews(containerView, linkLabel, titleLabel, timeStampLabel)
        
        NSLayoutConstraint.activate([
            // Container View
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            containerView.heightAnchor.constraint(equalToConstant: 200),
            containerView.widthAnchor.constraint(equalToConstant: 350),
            
            // Link Label
            linkLabel.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 12),
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
