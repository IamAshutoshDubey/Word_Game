//
//  AppAssembly.swift
//  WordGame
//
//  Created by Ashutosh Dubey on 09/10/20.
//

import Foundation
import Swinject

class AppAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(AppRouterType.self) { resolver in
            return AppRouter(resolver: resolver)
        }
        
        container.register(WordsLoaderType.self) { _ in
            return WordsLoader()
        }
        
        container.register(WordsProviderType.self) { resolver in
            let loader = resolver.resolve(WordsLoaderType.self)!
            return WordsProvider(wordsLoader: loader)
        }
        
        container.register(GameType.self)  { resolver in
            let provider = resolver.resolve(WordsProviderType.self)!
            return Game(wordsProvider: provider)
        }
        
        container.register(PlayGameViewModel.self) { resolver in
            let game = resolver.resolve(GameType.self)!
            let router = resolver.resolve(AppRouterType.self)!
            return PlayGameViewModel(game: game, router: router)
        }
        
        container.register(GameOverViewModel.self) { resolver in
            return GameOverViewModel()
        }
        
    }
}
