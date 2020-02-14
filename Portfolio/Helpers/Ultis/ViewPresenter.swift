//
//  ViewPresenter.swift
//  Portfolio
//
//  Created by Nguyen Trung Hieu on 2/11/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import Foundation
import UIKit

class ViewPresenter {
    
    public static func replaceRootView(for viewController: UIViewController,
                                       duration: TimeInterval = 0.3,
                                       options: UIView.AnimationOptions = .transitionCrossDissolve,
                                       completion: ((Bool) -> Void)? = nil) {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        guard let rootViewController = window.rootViewController else {
            return
        }
        
        viewController.view.frame = rootViewController.view.frame
        viewController.view.layoutIfNeeded()
        
        UIView.transition(with: window, duration: duration, options: options, animations: {
            window.rootViewController = viewController
        }, completion: completion)
    }
}
