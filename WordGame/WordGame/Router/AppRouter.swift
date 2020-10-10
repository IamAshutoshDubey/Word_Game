//
//  AppRouter.swift
//  WordGame
//
//  Created by Ashutosh Dubey on 09/10/20.
//

import Foundation
import UIKit
import Swinject
import RxSwift

//sourcery: AutoMockable
protocol AppRouterType: BaseRouterType {
    func startJourney(window: UIWindow)
}

struct AppRouter: AppRouterType {
    private let resolver: Resolver
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func startJourney(window: UIWindow) {
        let storyboard = UIStoryboard(name: "WordGame", bundle: nil)
        guard let viewController =  storyboard.instantiateViewController(identifier: "PlayGameViewController")  as? PlayGameViewController else {
            return
        }
        let viewModel = resolver.resolve(PlayGameViewModel.self)
        viewController.viewModel = viewModel
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
