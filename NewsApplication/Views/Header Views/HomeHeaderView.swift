//
//  HomeHeaderView.swift
//  NewsApplication
//
//  Created by Space Wizard on 12/20/23.
//

import Foundation
import UIKit

class HomeHeaderView: UIView {
    
    var onTap: (() -> Void)?
    
    private let sidebarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "sidebar"), for: .normal)
        return button
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "search"), for: .normal)
        button.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let profileContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.layer.cornerRadius = 22
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "For you"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = UIColor(hex: "#171A1FFF")
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func searchButtonTapped() {
        onTap?()
    }
}

private extension HomeHeaderView {
    
    func setup() {
        addSubviews(sidebarButton, searchButton, profileContainerView, titleLabel)
        
        NSLayoutConstraint.activate([
            // Sidebar Button
            sidebarButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            sidebarButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 23),
            sidebarButton.widthAnchor.constraint(equalToConstant: 24),
            sidebarButton.heightAnchor.constraint(equalToConstant: 24),
            
            // Title Label
            titleLabel.leadingAnchor.constraint(equalTo: sidebarButton.trailingAnchor, constant: 12),
            titleLabel.centerYAnchor.constraint(equalTo: sidebarButton.centerYAnchor),
            
            // Search Button
            searchButton.trailingAnchor.constraint(equalTo: profileContainerView.leadingAnchor, constant: -12),
            searchButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 23),
            searchButton.heightAnchor.constraint(equalToConstant: 24),
            searchButton.widthAnchor.constraint(equalToConstant: 24),
            searchButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            
            // Profile Container View
            profileContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            profileContainerView.centerYAnchor.constraint(equalTo: searchButton.centerYAnchor),
            profileContainerView.heightAnchor.constraint(equalToConstant: 44),
            profileContainerView.widthAnchor.constraint(equalToConstant: 44)
        ])
    }
}
