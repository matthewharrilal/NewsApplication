//
//  MenuPresentationController.swift
//  NewsApplication
//
//  Created by Space Wizard on 12/23/23.
//

import Foundation
import UIKit

class MenuPresentationController: UIPresentationController {
    
    private var startingFrame: CGRect
    
    override func containerViewWillLayoutSubviews() {
        guard
            let containerView = containerView,
            let presentedView = presentedView
        else { return }
        
        presentedView.frame = CGRect(
            x: startingFrame.minX - containerView.bounds.width / 1.5,
            y: startingFrame.minY,
            width: 260,
            height: 368
        )
    }
    
    init(presentedViewController: UIViewController, presentingViewController: UIViewController?, startingFrame: CGRect) {
        self.startingFrame = startingFrame

        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
}
