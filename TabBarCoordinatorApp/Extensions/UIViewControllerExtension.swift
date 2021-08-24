//
//  Extension.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

extension UIViewController {
    open class func instance() -> Self {
        if let vc = createFromStoryboard(type: self) {
            return vc
        } else {
            print("WARNING: can't create view controller from storybard:\(self)")
            return self.init()
        }
    }
    
    private class func createFromStoryboard<T: UIViewController>(type: T.Type) -> T? {
        
        let storyboardName = String(describing: type)
        
        let bundle = Bundle(for: T.self)
        
        guard bundle.path(forResource: storyboardName, ofType: "storyboardc") != nil else {
            return nil
        }
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        
        guard let vc = storyboard.instantiateInitialViewController() else {
            print("no vc in storyboard(hint: check initial vc)") ; return nil
        }
        
        return vc as? T
    }
}

public protocol RootShowable: class {
    func showAsRoot()
}

extension RootShowable where Self: UIViewController {
    public func showAsRoot() {
        guard  let window = window else {
            print("WARNING: no window!")
            return
        }
        window.rootViewController = self
        window.makeKeyAndVisible()
    }
}

extension UIViewController: RootShowable {
    public var window: UIWindow? {
        var appWindow = view.window
        if appWindow == nil {
            if UIApplication.shared.windows.count > 0 {
                appWindow = UIApplication.shared.windows[0]
            }
        }
        return appWindow
    }
 
    public var contentViewController: UIViewController? {
        if let navigationViewController = self as? UINavigationController {
            return navigationViewController.topViewController?.contentViewController
        } else {
            return self
        }
    }
}
