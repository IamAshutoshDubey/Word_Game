//
//  ViewControllerType.swift
//  WordGame
//
//  Created by Ashutosh Dubey on 09/10/20.
//

import UIKit

//sourcery: AutoMockable
public protocol ViewControllerType: AnyObject {
    func push(_ view: ViewControllerType, animated: Bool)
    func pop(animated: Bool)
    func addToViewWindow(subView: UIView)
}

extension UIViewController: ViewControllerType {
    
    public var controller: UIViewController { return self }

    public func push(_ view: ViewControllerType, animated: Bool) {
        guard let viewController = view as? UIViewController else { return }
        let nav = (self as? UINavigationController) ?? self.navigationController
        nav?.pushViewController(viewController, animated: animated)
    }

    public func pop(animated: Bool) {
        _ = navigationController?.popViewController(animated: animated)
    }

    public func pop(to source: ViewControllerType) {
        guard let controller = source as? UIViewController else { return }
        _ = navigationController?.popToViewController(controller, animated: true)
    }
    
    public func addToViewWindow(subView: UIView) {
        view.window?.addSubview(subView)
    }
}
