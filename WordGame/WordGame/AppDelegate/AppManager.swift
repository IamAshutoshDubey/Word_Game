//
//  AppManager.swift
//  WordGame
//
//  Created by Ashutosh Dubey on 09/10/20.
//

import Foundation
import Swinject


class AppManager {
    static let shared = AppManager()

    // MARK: Module Assemblers
    private var container: Container!
    public var appAssembler: Assembler
    
    private init() {
        container = Container()
        appAssembler = Assembler([AppAssembly()], container: container)
    }
}
