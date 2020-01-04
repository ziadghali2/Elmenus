//
//  UIViewController.swift
//  Tooli
//
//  Created by Ziad Ghali on 4/4/19.
//  Copyright © 2019 Algorithmz. All rights reserved.
//

import UIKit

//MARK: - UIViewController+Extension
extension UIViewController {
    func add(child: UIViewController, at containerView: UIView) {
        addChild(child)
        containerView.addSubview(child.view)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        let topAnchor = child.view.topAnchor.constraint(equalTo: containerView.topAnchor)
        let bottomAnchor = child.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        let leadingAnchor = child.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor)
        let trailingAnchor = child.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        containerView.addConstraints([topAnchor, bottomAnchor, leadingAnchor, trailingAnchor])
        child.didMove(toParent: self)
    }
    
    func remove() {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
    
    func removeAllChilds() {
        if !children.isEmpty {
            let viewControllers:[UIViewController] = self.children
            for viewContoller in viewControllers {
               viewContoller.remove()
            }
        }
    }
    
}
