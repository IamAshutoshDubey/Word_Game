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
    func naviagteToGameOverScreen(source: ViewControllerType, isGameOver: Bool)
}

struct AppRouter: AppRouterType {
    private let resolver: Resolver
    private let storyboard: UIStoryboard
    
    init(resolver: Resolver) {
        self.resolver = resolver
        self.storyboard = UIStoryboard(name: "WordGame", bundle: nil)
    }
    
    func startJourney(window: UIWindow) {
        guard let viewController =  storyboard.instantiateViewController(identifier: "PlayGameViewController")  as? PlayGameViewController else {
            return
        }
        let viewModel = resolver.resolve(PlayGameViewModel.self)
        viewController.viewModel = viewModel
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func naviagteToGameOverScreen(source: ViewControllerType, isGameOver: Bool) {
        guard let viewController =  storyboard.instantiateViewController(identifier: "GameOverViewController")  as? GameOverViewController else {
            return
        }
        var viewModel = resolver.resolve(GameOverViewModel.self)!
        viewModel.isGameOver = isGameOver
        viewController.viewModel = viewModel
        source.push(viewController, animated: true)
    }
}
