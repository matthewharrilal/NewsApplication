//
//  SearchViewController.swift
//  NewsApplication
//
//  Created by Space Wizard on 12/21/23.
//

import Foundation
import UIKit

enum SearchSections: Int, CaseIterable {
    case recent
    case topics
}

class SearchViewController: UIViewController {
    
    private var section: SearchSections = .recent
    
    private let searchHeaderView: SearchHeaderView = {
        let view = SearchHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SearchRecentTableViewCell.self, forCellReuseIdentifier: SearchRecentTableViewCell.identifier)
        tableView.register(SearchTopicTableViewCell.self, forCellReuseIdentifier: SearchTopicTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        switch SearchSections(rawValue: indexPath.section) {
        case .recent:
            guard let recentCell = tableView.dequeueReusableCell(withIdentifier: SearchRecentTableViewCell.identifier, for: indexPath) as? SearchRecentTableViewCell else { return cell }
            
            cell = recentCell
            break
        case .topics:
            guard let topicCell = tableView.dequeueReusableCell(withIdentifier: SearchTopicTableViewCell.identifier, for: indexPath) as? SearchTopicTableViewCell else { return cell }
            cell = topicCell
            break
        default:
            break
        }
        
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SearchSections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch SearchSections(rawValue: section) {
        case .recent:
            return 3
        case .topics:
            return 4
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch SearchSections(rawValue: section) {
        case .recent:
            return UIView()
        case .topics:
            let headerView = SectionHeaderView()
            headerView.configureLabels(title: "", detail: "Topics")
            headerView.updateLabelStyle(style: .highlights)
            return headerView
        default:
            return UIView()
        }
    }
}
