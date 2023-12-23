//
//  SearchTransitionDelegate.swift
//  NewsApplication
//
//  Created by Space Wizard on 12/21/23.
//

import Foundation
import UIKit

class SearchTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    var searchTransitionAnimator = SearchTransitionAnimator()
    
    var startingFrame: CGRect = .zero
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return MenuPresentationController(presentedViewController: presented, presentingViewController: presenting, startingFrame: startingFrame)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        searchTransitionAnimator.transitioningForward = true
        return searchTransitionAnimator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        searchTransitionAnimator.transitioningForward = false
        return searchTransitionAnimator
    }
}
