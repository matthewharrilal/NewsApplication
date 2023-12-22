//
//  SearchHeaderView.swift
//  NewsApplication
//
//  Created by Space Wizard on 12/21/23.
//

import Foundation
import UIKit

class SearchHeaderView: UIView {
    
    var onTap: (() -> Void)?
    
    private lazy var backArrow: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "arrow"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        let attributedPlaceholder = NSAttributedString(
            string: "Search",
            attributes:
                [NSAttributedString.Key.foregroundColor: UIColor(hex: "#BCC1CAFF")]
        )
        textField.attributedPlaceholder = attributedPlaceholder
        return textField
    }()
    
    private let dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "#171A1FFF")
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func backButtonTapped() {
        onTap?()
    }
}

private extension SearchHeaderView {
    
    func setup() {
        addSubviews(backArrow, searchTextField, dividerView)
        
        NSLayoutConstraint.activate([
            // Back Arrow
            backArrow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backArrow.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            backArrow.widthAnchor.constraint(equalToConstant: 32),
            backArrow.heightAnchor.constraint(equalToConstant: 32),
            
            // Search Text Field
            searchTextField.leadingAnchor.constraint(equalTo: backArrow.trailingAnchor, constant: 16),
            searchTextField.centerYAnchor.constraint(equalTo: backArrow.centerYAnchor),
            searchTextField.heightAnchor.constraint(equalToConstant: 36),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            // Divider View
            dividerView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            dividerView.centerXAnchor.constraint(equalTo: searchTextField.centerXAnchor)
        ])
    }
}
