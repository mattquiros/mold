//
//  UIView.swift
//  Mold
//
//  Created by Matt Quiros on 4/15/15.
//  Copyright (c) 2015 Matt Quiros. All rights reserved.
//

import UIKit

public extension UIView {
    
    public class func disableAutoresizingMasksInViews(_ views: UIView...) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    /**
    Adds multiple subviews in order. Later arguments are placed on top of the views
    preceding them.
    */
    public func addSubviews(_ views: UIView ...) {
        for view in views {
            self.addSubview(view)
        }
    }
    
    /**
     Add subviews and fill the superview. Subviews are placed on top of the preding subviews.
     */
    public func addSubviewsAndFill(_ views: UIView ...) {
        for view in views {
            self.addSubviewAndFill(view)
        }
    }
    
    public func addSubviewAndFill(_ view: UIView) {
        self.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let views = ["view" : view]
        let rules = ["H:|-0-[view]-0-|",
            "V:|-0-[view]-0-|"]
        self.addConstraints(
            NSLayoutConstraint.constraintsWithVisualFormatArray(rules,
                metrics: nil,
                views: views))
    }
    
    public func fillSuperview() {
        if let superview = self.superview {
            self.translatesAutoresizingMaskIntoConstraints = false
            let views = ["view" : self]
            let rules = ["H:|-0-[view]-0-|",
                "V:|-0-[view]-0-|"]
            superview.addConstraints(
                NSLayoutConstraint.constraintsWithVisualFormatArray(rules,
                    metrics: nil,
                    views: views))
        }
    }
    
    public class func instantiateFromNib() -> Self {
        return self.instantiateFromNibInBundle(Bundle.main)
    }
    
    public class func clearBackgroundColors(_ views: UIView...) {
        for view in views {
            view.backgroundColor = UIColor.clear
        }
    }
    
    public class func clearBackgroundColors(_ views: [UIView]) {
        for view in views {
            view.backgroundColor = UIColor.clear
        }
    }
    
    public class func nib() -> UINib {
        return UINib(nibName: self.className(), bundle: Bundle.main)
    }
    
}

// MARK: - Private functions
extension UIView {
    
    class func instantiateFromNibInBundle<T: UIView>(_ bundle: Bundle) -> T {
        let objects = bundle.loadNibNamed(self.className(), owner: self, options: nil)!
        let view = objects.last as! T
        return view
    }
    
    /**
     Returns the name of this class based on a (poor?) assumption that it is the last
     token in the fully qualified class name assigned by Swift.
     */
    class func className() -> String {
        let description = self.classForCoder().description()
        if let className = description.components(separatedBy: ".").last {
            return className
        }
        fatalError("\(#function): This method no longer works for getting the Swift class name.")
    }
    
}
