//
//  UIAlertController.swift
//  Mold
//
//  Created by Matt Quiros on 04/07/2016.
//  Copyright © 2016 Matt Quiros. All rights reserved.
//

import UIKit

public extension UIAlertController {
    
    func addCancelAction() {
        let action = UIAlertAction(title: "Cancel", style: .cancel, handler: {[unowned self] _ in
            self.dismiss(animated: true, completion: nil)
        })
        self.addAction(action)
    }
    
}