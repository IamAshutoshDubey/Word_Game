// Generated using Sourcery 1.0.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



// Generated with SwiftyMocky 4.0.1

import SwiftyMocky
import XCTest
import Swinject
import UIKit
import RxSwift
import RxRelay
import RxCocoa
@testable import WordGame


// MARK: - AppRouterType

open class AppRouterTypeMock: AppRouterType, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func startJourney(window: UIWindow) {
        addInvocation(.m_startJourney__window_window(Parameter<UIWindow>.value(`window`)))
		let perform = methodPerformValue(.m_startJourney__window_window(Parameter<UIWindow>.value(`window`))) as? (UIWindow) -> Void
		perform?(`window`)
    }

    open func push(view: ViewControllerType, on sender: ViewControllerType) {
        addInvocation(.m_push__view_viewon_sender(Parameter<ViewControllerType>.value(`view`), Parameter<ViewControllerType>.value(`sender`)))
		let perform = methodPerformValue(.m_push__view_viewon_sender(Parameter<ViewControllerType>.value(`view`), Parameter<ViewControllerType>.value(`sender`))) as? (ViewControllerType, ViewControllerType) -> Void
		perform?(`view`, `sender`)
    }

    open func pop(view: ViewControllerType) {
        addInvocation(.m_pop__view_view(Parameter<ViewControllerType>.value(`view`)))
		let perform = methodPerformValue(.m_pop__view_view(Parameter<ViewControllerType>.value(`view`))) as? (ViewControllerType) -> Void
		perform?(`view`)
    }


    fileprivate enum MethodType {
        case m_startJourney__window_window(Parameter<UIWindow>)
        case m_push__view_viewon_sender(Parameter<ViewControllerType>, Parameter<ViewControllerType>)
        case m_pop__view_view(Parameter<ViewControllerType>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_startJourney__window_window(let lhsWindow), .m_startJourney__window_window(let rhsWindow)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsWindow, rhs: rhsWindow, with: matcher), lhsWindow, rhsWindow, "window"))
				return Matcher.ComparisonResult(results)

            case (.m_push__view_viewon_sender(let lhsView, let lhsSender), .m_push__view_viewon_sender(let rhsView, let rhsSender)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsView, rhs: rhsView, with: matcher), lhsView, rhsView, "view"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsSender, rhs: rhsSender, with: matcher), lhsSender, rhsSender, "on sender"))
				return Matcher.ComparisonResult(results)

            case (.m_pop__view_view(let lhsView), .m_pop__view_view(let rhsView)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsView, rhs: rhsView, with: matcher), lhsView, rhsView, "view"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_startJourney__window_window(p0): return p0.intValue
            case let .m_push__view_viewon_sender(p0, p1): return p0.intValue + p1.intValue
            case let .m_pop__view_view(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_startJourney__window_window: return ".startJourney(window:)"
            case .m_push__view_viewon_sender: return ".push(view:on:)"
            case .m_pop__view_view: return ".pop(view:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func startJourney(window: Parameter<UIWindow>) -> Verify { return Verify(method: .m_startJourney__window_window(`window`))}
        public static func push(view: Parameter<ViewControllerType>, on sender: Parameter<ViewControllerType>) -> Verify { return Verify(method: .m_push__view_viewon_sender(`view`, `sender`))}
        public static func pop(view: Parameter<ViewControllerType>) -> Verify { return Verify(method: .m_pop__view_view(`view`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func startJourney(window: Parameter<UIWindow>, perform: @escaping (UIWindow) -> Void) -> Perform {
            return Perform(method: .m_startJourney__window_window(`window`), performs: perform)
        }
        public static func push(view: Parameter<ViewControllerType>, on sender: Parameter<ViewControllerType>, perform: @escaping (ViewControllerType, ViewControllerType) -> Void) -> Perform {
            return Perform(method: .m_push__view_viewon_sender(`view`, `sender`), performs: perform)
        }
        public static func pop(view: Parameter<ViewControllerType>, perform: @escaping (ViewControllerType) -> Void) -> Perform {
            return Perform(method: .m_pop__view_view(`view`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - GameType

open class GameTypeMock: GameType, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }

    public var liveScoreObservable: Observable<LiveScore> {
		get {	invocations.append(.p_liveScoreObservable_get); return __p_liveScoreObservable ?? givenGetterValue(.p_liveScoreObservable_get, "GameTypeMock - stub value for liveScoreObservable was not defined") }
	}
	private var __p_liveScoreObservable: (Observable<LiveScore>)?

    public var questionObservable: Observable<AttemptQuestion?> {
		get {	invocations.append(.p_questionObservable_get); return __p_questionObservable ?? givenGetterValue(.p_questionObservable_get, "GameTypeMock - stub value for questionObservable was not defined") }
	}
	private var __p_questionObservable: (Observable<AttemptQuestion?>)?

    public var userResponseObservable: PublishSubject<UserResponse> {
		get {	invocations.append(.p_userResponseObservable_get); return __p_userResponseObservable ?? givenGetterValue(.p_userResponseObservable_get, "GameTypeMock - stub value for userResponseObservable was not defined") }
	}
	private var __p_userResponseObservable: (PublishSubject<UserResponse>)?





    open func startGame() -> Single<Void> {
        addInvocation(.m_startGame)
		let perform = methodPerformValue(.m_startGame) as? () -> Void
		perform?()
		var __value: Single<Void>
		do {
		    __value = try methodReturnValue(.m_startGame).casted()
		} catch {
			onFatalFailure("Stub return value not specified for startGame(). Use given")
			Failure("Stub return value not specified for startGame(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_startGame
        case p_liveScoreObservable_get
        case p_questionObservable_get
        case p_userResponseObservable_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_startGame, .m_startGame): return .match
            case (.p_liveScoreObservable_get,.p_liveScoreObservable_get): return Matcher.ComparisonResult.match
            case (.p_questionObservable_get,.p_questionObservable_get): return Matcher.ComparisonResult.match
            case (.p_userResponseObservable_get,.p_userResponseObservable_get): return Matcher.ComparisonResult.match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_startGame: return 0
            case .p_liveScoreObservable_get: return 0
            case .p_questionObservable_get: return 0
            case .p_userResponseObservable_get: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_startGame: return ".startGame()"
            case .p_liveScoreObservable_get: return "[get] .liveScoreObservable"
            case .p_questionObservable_get: return "[get] .questionObservable"
            case .p_userResponseObservable_get: return "[get] .userResponseObservable"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func liveScoreObservable(getter defaultValue: Observable<LiveScore>...) -> PropertyStub {
            return Given(method: .p_liveScoreObservable_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func questionObservable(getter defaultValue: Observable<AttemptQuestion?>...) -> PropertyStub {
            return Given(method: .p_questionObservable_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func userResponseObservable(getter defaultValue: PublishSubject<UserResponse>...) -> PropertyStub {
            return Given(method: .p_userResponseObservable_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func startGame(willReturn: Single<Void>...) -> MethodStub {
            return Given(method: .m_startGame, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func startGame(willProduce: (Stubber<Single<Void>>) -> Void) -> MethodStub {
            let willReturn: [Single<Void>] = []
			let given: Given = { return Given(method: .m_startGame, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<Void>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func startGame() -> Verify { return Verify(method: .m_startGame)}
        public static var liveScoreObservable: Verify { return Verify(method: .p_liveScoreObservable_get) }
        public static var questionObservable: Verify { return Verify(method: .p_questionObservable_get) }
        public static var userResponseObservable: Verify { return Verify(method: .p_userResponseObservable_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func startGame(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_startGame, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - ViewControllerType

open class ViewControllerTypeMock: ViewControllerType, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func push(_ view: ViewControllerType, animated: Bool) {
        addInvocation(.m_push__viewanimated_animated(Parameter<ViewControllerType>.value(`view`), Parameter<Bool>.value(`animated`)))
		let perform = methodPerformValue(.m_push__viewanimated_animated(Parameter<ViewControllerType>.value(`view`), Parameter<Bool>.value(`animated`))) as? (ViewControllerType, Bool) -> Void
		perform?(`view`, `animated`)
    }

    open func pop(animated: Bool) {
        addInvocation(.m_pop__animated_animated(Parameter<Bool>.value(`animated`)))
		let perform = methodPerformValue(.m_pop__animated_animated(Parameter<Bool>.value(`animated`))) as? (Bool) -> Void
		perform?(`animated`)
    }

    open func addToViewWindow(subView: UIView) {
        addInvocation(.m_addToViewWindow__subView_subView(Parameter<UIView>.value(`subView`)))
		let perform = methodPerformValue(.m_addToViewWindow__subView_subView(Parameter<UIView>.value(`subView`))) as? (UIView) -> Void
		perform?(`subView`)
    }


    fileprivate enum MethodType {
        case m_push__viewanimated_animated(Parameter<ViewControllerType>, Parameter<Bool>)
        case m_pop__animated_animated(Parameter<Bool>)
        case m_addToViewWindow__subView_subView(Parameter<UIView>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_push__viewanimated_animated(let lhsView, let lhsAnimated), .m_push__viewanimated_animated(let rhsView, let rhsAnimated)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsView, rhs: rhsView, with: matcher), lhsView, rhsView, "_ view"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsAnimated, rhs: rhsAnimated, with: matcher), lhsAnimated, rhsAnimated, "animated"))
				return Matcher.ComparisonResult(results)

            case (.m_pop__animated_animated(let lhsAnimated), .m_pop__animated_animated(let rhsAnimated)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsAnimated, rhs: rhsAnimated, with: matcher), lhsAnimated, rhsAnimated, "animated"))
				return Matcher.ComparisonResult(results)

            case (.m_addToViewWindow__subView_subView(let lhsSubview), .m_addToViewWindow__subView_subView(let rhsSubview)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsSubview, rhs: rhsSubview, with: matcher), lhsSubview, rhsSubview, "subView"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_push__viewanimated_animated(p0, p1): return p0.intValue + p1.intValue
            case let .m_pop__animated_animated(p0): return p0.intValue
            case let .m_addToViewWindow__subView_subView(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_push__viewanimated_animated: return ".push(_:animated:)"
            case .m_pop__animated_animated: return ".pop(animated:)"
            case .m_addToViewWindow__subView_subView: return ".addToViewWindow(subView:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func push(_ view: Parameter<ViewControllerType>, animated: Parameter<Bool>) -> Verify { return Verify(method: .m_push__viewanimated_animated(`view`, `animated`))}
        public static func pop(animated: Parameter<Bool>) -> Verify { return Verify(method: .m_pop__animated_animated(`animated`))}
        public static func addToViewWindow(subView: Parameter<UIView>) -> Verify { return Verify(method: .m_addToViewWindow__subView_subView(`subView`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func push(_ view: Parameter<ViewControllerType>, animated: Parameter<Bool>, perform: @escaping (ViewControllerType, Bool) -> Void) -> Perform {
            return Perform(method: .m_push__viewanimated_animated(`view`, `animated`), performs: perform)
        }
        public static func pop(animated: Parameter<Bool>, perform: @escaping (Bool) -> Void) -> Perform {
            return Perform(method: .m_pop__animated_animated(`animated`), performs: perform)
        }
        public static func addToViewWindow(subView: Parameter<UIView>, perform: @escaping (UIView) -> Void) -> Perform {
            return Perform(method: .m_addToViewWindow__subView_subView(`subView`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - WordsLoaderType

open class WordsLoaderTypeMock: WordsLoaderType, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func loadWords() -> Single<[Word]> {
        addInvocation(.m_loadWords)
		let perform = methodPerformValue(.m_loadWords) as? () -> Void
		perform?()
		var __value: Single<[Word]>
		do {
		    __value = try methodReturnValue(.m_loadWords).casted()
		} catch {
			onFatalFailure("Stub return value not specified for loadWords(). Use given")
			Failure("Stub return value not specified for loadWords(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_loadWords

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_loadWords, .m_loadWords): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_loadWords: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_loadWords: return ".loadWords()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func loadWords(willReturn: Single<[Word]>...) -> MethodStub {
            return Given(method: .m_loadWords, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func loadWords(willProduce: (Stubber<Single<[Word]>>) -> Void) -> MethodStub {
            let willReturn: [Single<[Word]>] = []
			let given: Given = { return Given(method: .m_loadWords, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<[Word]>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func loadWords() -> Verify { return Verify(method: .m_loadWords)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func loadWords(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_loadWords, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - WordsProviderType

open class WordsProviderTypeMock: WordsProviderType, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func fetchWords() -> Single<Bool> {
        addInvocation(.m_fetchWords)
		let perform = methodPerformValue(.m_fetchWords) as? () -> Void
		perform?()
		var __value: Single<Bool>
		do {
		    __value = try methodReturnValue(.m_fetchWords).casted()
		} catch {
			onFatalFailure("Stub return value not specified for fetchWords(). Use given")
			Failure("Stub return value not specified for fetchWords(). Use given")
		}
		return __value
    }

    open func getWordPairs(correctPercentage: Double) -> [WordPair] {
        addInvocation(.m_getWordPairs__correctPercentage_correctPercentage(Parameter<Double>.value(`correctPercentage`)))
		let perform = methodPerformValue(.m_getWordPairs__correctPercentage_correctPercentage(Parameter<Double>.value(`correctPercentage`))) as? (Double) -> Void
		perform?(`correctPercentage`)
		var __value: [WordPair]
		do {
		    __value = try methodReturnValue(.m_getWordPairs__correctPercentage_correctPercentage(Parameter<Double>.value(`correctPercentage`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getWordPairs(correctPercentage: Double). Use given")
			Failure("Stub return value not specified for getWordPairs(correctPercentage: Double). Use given")
		}
		return __value
    }

    open func getWordPairs(maxpairs: Int, correctPercentage: Double) -> [WordPair] {
        addInvocation(.m_getWordPairs__maxpairs_maxpairscorrectPercentage_correctPercentage(Parameter<Int>.value(`maxpairs`), Parameter<Double>.value(`correctPercentage`)))
		let perform = methodPerformValue(.m_getWordPairs__maxpairs_maxpairscorrectPercentage_correctPercentage(Parameter<Int>.value(`maxpairs`), Parameter<Double>.value(`correctPercentage`))) as? (Int, Double) -> Void
		perform?(`maxpairs`, `correctPercentage`)
		var __value: [WordPair]
		do {
		    __value = try methodReturnValue(.m_getWordPairs__maxpairs_maxpairscorrectPercentage_correctPercentage(Parameter<Int>.value(`maxpairs`), Parameter<Double>.value(`correctPercentage`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getWordPairs(maxpairs: Int, correctPercentage: Double). Use given")
			Failure("Stub return value not specified for getWordPairs(maxpairs: Int, correctPercentage: Double). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_fetchWords
        case m_getWordPairs__correctPercentage_correctPercentage(Parameter<Double>)
        case m_getWordPairs__maxpairs_maxpairscorrectPercentage_correctPercentage(Parameter<Int>, Parameter<Double>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_fetchWords, .m_fetchWords): return .match

            case (.m_getWordPairs__correctPercentage_correctPercentage(let lhsCorrectpercentage), .m_getWordPairs__correctPercentage_correctPercentage(let rhsCorrectpercentage)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsCorrectpercentage, rhs: rhsCorrectpercentage, with: matcher), lhsCorrectpercentage, rhsCorrectpercentage, "correctPercentage"))
				return Matcher.ComparisonResult(results)

            case (.m_getWordPairs__maxpairs_maxpairscorrectPercentage_correctPercentage(let lhsMaxpairs, let lhsCorrectpercentage), .m_getWordPairs__maxpairs_maxpairscorrectPercentage_correctPercentage(let rhsMaxpairs, let rhsCorrectpercentage)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMaxpairs, rhs: rhsMaxpairs, with: matcher), lhsMaxpairs, rhsMaxpairs, "maxpairs"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsCorrectpercentage, rhs: rhsCorrectpercentage, with: matcher), lhsCorrectpercentage, rhsCorrectpercentage, "correctPercentage"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_fetchWords: return 0
            case let .m_getWordPairs__correctPercentage_correctPercentage(p0): return p0.intValue
            case let .m_getWordPairs__maxpairs_maxpairscorrectPercentage_correctPercentage(p0, p1): return p0.intValue + p1.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_fetchWords: return ".fetchWords()"
            case .m_getWordPairs__correctPercentage_correctPercentage: return ".getWordPairs(correctPercentage:)"
            case .m_getWordPairs__maxpairs_maxpairscorrectPercentage_correctPercentage: return ".getWordPairs(maxpairs:correctPercentage:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func fetchWords(willReturn: Single<Bool>...) -> MethodStub {
            return Given(method: .m_fetchWords, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getWordPairs(correctPercentage: Parameter<Double>, willReturn: [WordPair]...) -> MethodStub {
            return Given(method: .m_getWordPairs__correctPercentage_correctPercentage(`correctPercentage`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getWordPairs(maxpairs: Parameter<Int>, correctPercentage: Parameter<Double>, willReturn: [WordPair]...) -> MethodStub {
            return Given(method: .m_getWordPairs__maxpairs_maxpairscorrectPercentage_correctPercentage(`maxpairs`, `correctPercentage`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func fetchWords(willProduce: (Stubber<Single<Bool>>) -> Void) -> MethodStub {
            let willReturn: [Single<Bool>] = []
			let given: Given = { return Given(method: .m_fetchWords, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<Bool>).self)
			willProduce(stubber)
			return given
        }
        public static func getWordPairs(correctPercentage: Parameter<Double>, willProduce: (Stubber<[WordPair]>) -> Void) -> MethodStub {
            let willReturn: [[WordPair]] = []
			let given: Given = { return Given(method: .m_getWordPairs__correctPercentage_correctPercentage(`correctPercentage`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: ([WordPair]).self)
			willProduce(stubber)
			return given
        }
        public static func getWordPairs(maxpairs: Parameter<Int>, correctPercentage: Parameter<Double>, willProduce: (Stubber<[WordPair]>) -> Void) -> MethodStub {
            let willReturn: [[WordPair]] = []
			let given: Given = { return Given(method: .m_getWordPairs__maxpairs_maxpairscorrectPercentage_correctPercentage(`maxpairs`, `correctPercentage`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: ([WordPair]).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func fetchWords() -> Verify { return Verify(method: .m_fetchWords)}
        public static func getWordPairs(correctPercentage: Parameter<Double>) -> Verify { return Verify(method: .m_getWordPairs__correctPercentage_correctPercentage(`correctPercentage`))}
        public static func getWordPairs(maxpairs: Parameter<Int>, correctPercentage: Parameter<Double>) -> Verify { return Verify(method: .m_getWordPairs__maxpairs_maxpairscorrectPercentage_correctPercentage(`maxpairs`, `correctPercentage`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func fetchWords(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_fetchWords, performs: perform)
        }
        public static func getWordPairs(correctPercentage: Parameter<Double>, perform: @escaping (Double) -> Void) -> Perform {
            return Perform(method: .m_getWordPairs__correctPercentage_correctPercentage(`correctPercentage`), performs: perform)
        }
        public static func getWordPairs(maxpairs: Parameter<Int>, correctPercentage: Parameter<Double>, perform: @escaping (Int, Double) -> Void) -> Perform {
            return Perform(method: .m_getWordPairs__maxpairs_maxpairscorrectPercentage_correctPercentage(`maxpairs`, `correctPercentage`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

