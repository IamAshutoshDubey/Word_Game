//
//  BaseRouterType.swift
//  WordGame
//
//  Created by Ashutosh Dubey on 09/10/20.
//

import UIKit

public protocol BaseRouterType {
    func push(view: ViewControllerType, on sender: ViewControllerType)
    func pop(view: ViewControllerType)
}

public extension BaseRouterType {
    func push(view: ViewControllerType, on sender: ViewControllerType) {
        sender.push(view, animated: true)
    }

    func pop(view: ViewControllerType) {
        view.pop(animated: true)
    }
}
