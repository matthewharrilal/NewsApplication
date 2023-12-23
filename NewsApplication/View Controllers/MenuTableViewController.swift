//
//  MenuTableViewController.swift
//  NewsApplication
//
//  Created by Space Wizard on 12/22/23.
//

import Foundation
import UIKit

class MenuTableViewController: UITableViewController {
    
    enum Sections: CaseIterable {
        
        case articleOperations
        case helpOperations
        case more
        
        enum ArticleOperations: Int, CaseIterable {
            case saveArticle
            case shareArticle
            case copyLine
        }
        
        enum HelpOperations: Int, CaseIterable {
            case links
            case reportIssue
            case sendFeedback
        }
        
        enum More: Int, CaseIterable {
            case moreLikeThis
            case fewerLikeThis
        }
        
        static func numberOfRows(in section: Sections) -> Int {
            switch section {
            case .articleOperations:
                return ArticleOperations.allCases.count
            case .helpOperations:
                return HelpOperations.allCases.count
            case .more:
                return More.allCases.count
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

extension MenuTableViewController {
    
    private func setup() {
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.identifier)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as? MenuTableViewCell else { return UITableViewCell() }
        
        let currentSection = Sections.allCases[indexPath.section]
        
        switch currentSection {
            // Article Operations
        case .articleOperations:
            let currentRow = Sections.ArticleOperations.allCases[indexPath.row]
            switch currentRow {
            case .saveArticle:
                cell.configure("Save Article")
            case .shareArticle:
                cell.configure("Share Article")
            case .copyLine:
                cell.configure("Copy Link")
            }
            
            // Help Operations
        case .helpOperations:
            let currentRow = Sections.HelpOperations.allCases[indexPath.row]
            switch currentRow {
            case .reportIssue:
                cell.configure("Report Issue")
            case .sendFeedback:
                cell.configure("Send Feedback")
            case .links:
                cell.configure("Go to sometech.co")
            }
            
        case .more:
            let currentRow = Sections.More.allCases[indexPath.row]
            switch currentRow {
            case .moreLikeThis:
                cell.configure("More Like This")
            case .fewerLikeThis:
                cell.configure("Fewer Like This")
            }
        }
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSection = Sections.allCases[section]
        
        switch currentSection {
        case .articleOperations:
            return Sections.ArticleOperations.allCases.count
        case .helpOperations:
            return Sections.HelpOperations.allCases.count
        case .more:
            return Sections.More.allCases.count
        }
    }
    
}
