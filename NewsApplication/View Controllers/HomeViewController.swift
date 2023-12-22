//
//  HomeViewController.swift
//  NewsApplication
//
//  Created by Space Wizard on 12/19/23.
//

import UIKit

enum Sections: Int, CaseIterable {
    case topStories
    case highlights
}

class HomeViewController: UIViewController {
    
    private var results: Results? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    let searchTransitionDelegate = SearchTransitionDelegate()
    
    enum Constants {
        static let newsURL: URL? = URL(string: "https://newsdata.io/api/1/news?apikey=pub_350683d632477728ccfb7555f19d1165a9524&q=volcano")
    }
    
    private let homeHeaderView: HomeHeaderView = {
        let headerView = HomeHeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(TopStoriesTableViewCell.self, forCellReuseIdentifier: TopStoriesTableViewCell.cellIdentifier)
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.cellIdentifier)
        tableView.register(SectionHeaderView.self, forHeaderFooterViewReuseIdentifier: SectionHeaderView.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setup()
        
        Task {
            do {
                let results = try await fetchNewsResults()
                self.results = results
            }
            catch {
                print("Error when fetching news results")
            }
        }
    }
    
    enum Errors: Error {
        case invalidURL
        case errorDecoding
    }
}

// MARK: Network Related Methods
private extension HomeViewController {
    
    func fetchNewsResults() async throws -> Results {
        
        guard let url = Constants.newsURL else {
            throw Errors.invalidURL
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let results = try decoder.decode(Results.self, from: data)
            return results
        }
        catch {
            throw Errors.errorDecoding
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch Sections(rawValue: section) {
        case .topStories:
            return 1
        case .highlights:
            return results?.results.count ?? 0
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell(frame: .zero)
        
        switch Sections(rawValue: indexPath.section) {
        case .topStories:
            guard let topStoriesCell = tableView.dequeueReusableCell(withIdentifier: TopStoriesTableViewCell.cellIdentifier) as? TopStoriesTableViewCell else { return UITableViewCell() }
            topStoriesCell.collectionView.delegate = topStoriesCell
            topStoriesCell.collectionView.dataSource = topStoriesCell
            
            topStoriesCell.onTap = { [weak self] startingFrame in
                self?.presentTopStoriesDetailViewController(startingFrame)
            }
            
            cell = topStoriesCell
            break
        case .highlights:
            guard let homeTableCell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.cellIdentifier) as? HomeTableViewCell else { return UITableViewCell() }
            
            homeTableCell.configure(result: results?.results[indexPath.row])
            cell = homeTableCell
            break
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SectionHeaderView()
        
        switch Sections(rawValue: section) {
        case .topStories:
            headerView.configureLabels(title: "Monday, September 21st", detail: "Top Stories")
            headerView.updateLabelStyle(style: .topStories)
            break
        case .highlights:
            headerView.configureLabels(title: "", detail: "Highlights")
            headerView.updateLabelStyle(style: .highlights)
            break
        default:
            break
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
    
    
}

// MARK: UI Related Methods
private extension HomeViewController {
    
    func setup() {
        setupTableView()
    }
    
    func setupTableView() {
        view.addSubviews(homeHeaderView, tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .white
        
        // MARK: TODO Move logic here to be encapsulated elsewhere
        homeHeaderView.onTap = { [weak self] in
            let searchVC = SearchViewController()
            searchVC.modalPresentationStyle = .custom
            searchVC.transitioningDelegate = self?.searchTransitionDelegate
            self?.present(searchVC, animated: true, completion: nil)
        }
        
        NSLayoutConstraint.activate([
            // Home Header View
            homeHeaderView.topAnchor.constraint(equalTo: view.topAnchor),
            homeHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Table View
            tableView.topAnchor.constraint(equalTo: homeHeaderView.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func presentTopStoriesDetailViewController(_ startingFrame: CGRect) {
        let topStoriesDetailViewController = TopStoriesDetailViewController(startingFrame: startingFrame)
        
        addChild(topStoriesDetailViewController)
        topStoriesDetailViewController.view.frame = startingFrame
        
        view.addSubview(topStoriesDetailViewController.view)
        topStoriesDetailViewController.didMove(toParent: self)
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut) { [weak self] in
            guard let frame = self?.view.frame else { return }
            
            topStoriesDetailViewController.view.frame = frame
        }
        
        topStoriesDetailViewController.onTap = {
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn) {
                topStoriesDetailViewController.view.frame = startingFrame
            } completion: { _ in
                topStoriesDetailViewController.willMove(toParent: nil)
                topStoriesDetailViewController.view.removeFromSuperview()
                topStoriesDetailViewController.removeFromParent()
            }
        }
    }
}

