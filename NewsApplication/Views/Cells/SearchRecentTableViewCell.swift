//
//  SearchRecentTableViewCell.swift
//  NewsApplication
//
//  Created by Space Wizard on 12/21/23.
//

import Foundation
import UIKit

class SearchRecentTableViewCell: UITableViewCell {
    
    private var clockIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "clock"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "mortage interest rate"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    static var identifier: String {
        String(describing: SearchRecentTableViewCell.self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SearchRecentTableViewCell {
    
    func setup() {
        contentView.addSubviews(clockIcon, titleLabel)
        
        NSLayoutConstraint.activate([
            // Clock Icon
            clockIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            clockIcon.heightAnchor.constraint(equalToConstant: 24),
            clockIcon.widthAnchor.constraint(equalToConstant: 24),
            clockIcon.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            // Title Label
            titleLabel.leadingAnchor.constraint(equalTo: clockIcon.trailingAnchor, constant: 29),
            titleLabel.centerYAnchor.constraint(equalTo: clockIcon.centerYAnchor)
        ])
    }
}
