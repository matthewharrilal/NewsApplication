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
            x: startingFrame.minX,
            y: startingFrame.minY,
            width: containerView.bounds.width,
            height: containerView.bounds.height
        )
    }
    
    init(presentedViewController: UIViewController, presentingViewController: UIViewController?, startingFrame: CGRect) {
        self.startingFrame = startingFrame

        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
}
