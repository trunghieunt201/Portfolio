//
//  ViewController+Extention.swift
//  Portfolio
//
//  Created by Nguyen Trung Hieu on 2/10/20.
//  Copyright © 2020 Nguyen Trung Hieu. All rights reserved.
//

import Foundation
import UIKit
//import Toast_Swift

extension UIViewController {
    class func loadFromNib() -> Self {
        func loadFromNib<T: UIViewController>(_ viewType: T.Type) -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        return loadFromNib(self)
    }
    
    @objc func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
}
