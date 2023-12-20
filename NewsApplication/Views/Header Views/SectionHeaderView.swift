//
//  SectionHeaderView.swift
//  NewsApplication
//
//  Created by Space Wizard on 12/19/23.
//

import Foundation
import UIKit

class SectionHeaderView: UITableViewHeaderFooterView {
    
    static var identifier: String {
        String(describing: SectionHeaderView.self)
    }
        
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabels(title: String, detail: String) {
        titleLabel.text = title
        detailLabel.text = detail
    }
    
    func updateLabelStyle(style: Sections) {
        switch style {
        case .topStories:
            titleLabel.font = .systemFont(ofSize: 14, weight: .semibold)
            titleLabel.textColor = UIColor(hex: "#9095A0FF")
            detailLabel.font = .systemFont(ofSize: 20, weight: .bold)
            break
        case .highlights:
            detailLabel.font = .systemFont(ofSize: 24, weight: .bold)
            break
        }
    }
}

private extension SectionHeaderView {
    
    func setup() {
        
        contentView.addSubviews(titleLabel, detailLabel)
        contentView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            detailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            detailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24)
        ])
    }
}
