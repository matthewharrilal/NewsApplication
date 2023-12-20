//
//  TopStoriesDetailViewController.swift
//  NewsApplication
//
//  Created by Space Wizard on 12/20/23.
//

import Foundation
import UIKit

class TopStoriesDetailViewController: UIViewController {
    
    let startingFrame: CGRect
    
    init(startingFrame: CGRect) {
        self.startingFrame = startingFrame
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        view.layer.cornerRadius = 4
    }
}
