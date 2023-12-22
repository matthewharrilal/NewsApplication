//
//  SearchViewController.swift
//  NewsApplication
//
//  Created by Space Wizard on 12/21/23.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    private let searchHeaderView: SearchHeaderView = {
        let view = SearchHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

private extension SearchViewController {
    
    func setup() {
        view.addSubviews(searchHeaderView, tableView)
        view.backgroundColor = .white
        
        // MARK: TODO Move logic here to be encapsulated elsewhere
        searchHeaderView.onTap = { [weak self] in
            self?.dismiss(animated: true)
        }
        
        NSLayoutConstraint.activate([
            // Search Header View
            searchHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchHeaderView.heightAnchor.constraint(equalToConstant: 44),
            
            // Table View
            tableView.topAnchor.constraint(equalTo: searchHeaderView.bottomAnchor, constant: 24),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
}
