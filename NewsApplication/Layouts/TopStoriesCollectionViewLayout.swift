//
//  TopStoriesCollectionViewLayout.swift
//  NewsApplication
//
//  Created by Space Wizard on 12/20/23.
//

import Foundation
import UIKit

class TopStoriesCollectionViewLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

private extension TopStoriesCollectionViewLayout {
    
    func configureLayout() {
        scrollDirection = .horizontal
        minimumInteritemSpacing = 10
        minimumLineSpacing = 10
        itemSize = .init(width: 350, height: 200)
    }
}
