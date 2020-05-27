// MARK: - Mocks generated from file: CardApp/Misc/AnyView.swift

import Cuckoo
@testable import CardApp

import UIKit


 class MockAnyView: AnyView, Cuckoo.ProtocolMock {
    
     typealias MocksType = AnyView
    
     typealias Stubbing = __StubbingProxy_AnyView
     typealias Verification = __VerificationProxy_AnyView

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: AnyView?

     func enableDefaultImplementation(_ stub: AnyView) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var view: UIView {
        get {
            return cuckoo_manager.getter("view",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.view)
        }
        
    }
    

    

    

	 struct __StubbingProxy_AnyView: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var view: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockAnyView, UIView> {
	        return .init(manager: cuckoo_manager, name: "view")
	    }
	    
	    
	}

	 struct __VerificationProxy_AnyView: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var view: Cuckoo.VerifyReadOnlyProperty<UIView> {
	        return .init(manager: cuckoo_manager, name: "view", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class AnyViewStub: AnyView {
    
    
     var view: UIView {
        get {
            return DefaultValueRegistry.defaultValue(for: (UIView).self)
        }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: CardApp/Misc/Routers.swift

import Cuckoo
@testable import CardApp

import UIKit


 class MockRouterProtocol: RouterProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = RouterProtocol
    
     typealias Stubbing = __StubbingProxy_RouterProtocol
     typealias Verification = __VerificationProxy_RouterProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: RouterProtocol?

     func enableDefaultImplementation(_ stub: RouterProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var sourceViewController: UIViewController? {
        get {
            return cuckoo_manager.getter("sourceViewController",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.sourceViewController)
        }
        
        set {
            cuckoo_manager.setter("sourceViewController",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.sourceViewController = newValue)
        }
        
    }
    
    
    
     var closeCompletion: VoidHandler? {
        get {
            return cuckoo_manager.getter("closeCompletion",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.closeCompletion)
        }
        
        set {
            cuckoo_manager.setter("closeCompletion",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.closeCompletion = newValue)
        }
        
    }
    

    

    

	 struct __StubbingProxy_RouterProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var sourceViewController: Cuckoo.ProtocolToBeStubbedOptionalProperty<MockRouterProtocol, UIViewController> {
	        return .init(manager: cuckoo_manager, name: "sourceViewController")
	    }
	    
	    
	    var closeCompletion: Cuckoo.ProtocolToBeStubbedOptionalProperty<MockRouterProtocol, VoidHandler> {
	        return .init(manager: cuckoo_manager, name: "closeCompletion")
	    }
	    
	    
	}

	 struct __VerificationProxy_RouterProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var sourceViewController: Cuckoo.VerifyOptionalProperty<UIViewController> {
	        return .init(manager: cuckoo_manager, name: "sourceViewController", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var closeCompletion: Cuckoo.VerifyOptionalProperty<VoidHandler> {
	        return .init(manager: cuckoo_manager, name: "closeCompletion", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	}
}

 class RouterProtocolStub: RouterProtocol {
    
    
     var sourceViewController: UIViewController? {
        get {
            return DefaultValueRegistry.defaultValue(for: (UIViewController?).self)
        }
        
        set { }
        
    }
    
    
     var closeCompletion: VoidHandler? {
        get {
            return DefaultValueRegistry.defaultValue(for: (VoidHandler?).self)
        }
        
        set { }
        
    }
    

    

    
}


// MARK: - Mocks generated from file: CardApp/Modules/CardList/CardListInteractor.swift
// We don't need this for this project, kepping by considering extensive app

import Cuckoo
@testable import CardApp


 class MockCardListInteractorProtocol: CardListInteractorProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = CardListInteractorProtocol
    
     typealias Stubbing = __StubbingProxy_CardListInteractorProtocol
     typealias Verification = __VerificationProxy_CardListInteractorProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: CardListInteractorProtocol?

     func enableDefaultImplementation(_ stub: CardListInteractorProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    

	 struct __StubbingProxy_CardListInteractorProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	}

	 struct __VerificationProxy_CardListInteractorProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	}
}

 class CardListInteractorProtocolStub: CardListInteractorProtocol {
    

    

    
}


// MARK: - Mocks generated from file: CardApp/Modules/CardList/CardListRouter.swift

import Cuckoo
@testable import CardApp

import UIKit


 class MockCardListRouterProtocol: CardListRouterProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = CardListRouterProtocol
    
     typealias Stubbing = __StubbingProxy_CardListRouterProtocol
     typealias Verification = __VerificationProxy_CardListRouterProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: CardListRouterProtocol?

     func enableDefaultImplementation(_ stub: CardListRouterProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var sourceViewController: UIViewController? {
        get {
            return cuckoo_manager.getter("sourceViewController",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.sourceViewController)
        }
        
        set {
            cuckoo_manager.setter("sourceViewController",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.sourceViewController = newValue)
        }
        
    }
    
    
    
     var closeCompletion: VoidHandler? {
        get {
            return cuckoo_manager.getter("closeCompletion",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.closeCompletion)
        }
        
        set {
            cuckoo_manager.setter("closeCompletion",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.closeCompletion = newValue)
        }
        
    }
    

    

    
    
    
     func showAlert(cardNumber: String, cardOption: CardOption)  {
        
    return cuckoo_manager.call("showAlert(cardNumber: String, cardOption: CardOption)",
            parameters: (cardNumber, cardOption),
            escapingParameters: (cardNumber, cardOption),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.showAlert(cardNumber: cardNumber, cardOption: cardOption))
        
    }
    

	 struct __StubbingProxy_CardListRouterProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var sourceViewController: Cuckoo.ProtocolToBeStubbedOptionalProperty<MockCardListRouterProtocol, UIViewController> {
	        return .init(manager: cuckoo_manager, name: "sourceViewController")
	    }
	    
	    
	    var closeCompletion: Cuckoo.ProtocolToBeStubbedOptionalProperty<MockCardListRouterProtocol, VoidHandler> {
	        return .init(manager: cuckoo_manager, name: "closeCompletion")
	    }
	    
	    
	    func showAlert<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(cardNumber: M1, cardOption: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(String, CardOption)> where M1.MatchedType == String, M2.MatchedType == CardOption {
	        let matchers: [Cuckoo.ParameterMatcher<(String, CardOption)>] = [wrap(matchable: cardNumber) { $0.0 }, wrap(matchable: cardOption) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCardListRouterProtocol.self, method: "showAlert(cardNumber: String, cardOption: CardOption)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_CardListRouterProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var sourceViewController: Cuckoo.VerifyOptionalProperty<UIViewController> {
	        return .init(manager: cuckoo_manager, name: "sourceViewController", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var closeCompletion: Cuckoo.VerifyOptionalProperty<VoidHandler> {
	        return .init(manager: cuckoo_manager, name: "closeCompletion", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func showAlert<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(cardNumber: M1, cardOption: M2) -> Cuckoo.__DoNotUse<(String, CardOption), Void> where M1.MatchedType == String, M2.MatchedType == CardOption {
	        let matchers: [Cuckoo.ParameterMatcher<(String, CardOption)>] = [wrap(matchable: cardNumber) { $0.0 }, wrap(matchable: cardOption) { $0.1 }]
	        return cuckoo_manager.verify("showAlert(cardNumber: String, cardOption: CardOption)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class CardListRouterProtocolStub: CardListRouterProtocol {
    
    
     var sourceViewController: UIViewController? {
        get {
            return DefaultValueRegistry.defaultValue(for: (UIViewController?).self)
        }
        
        set { }
        
    }
    
    
     var closeCompletion: VoidHandler? {
        get {
            return DefaultValueRegistry.defaultValue(for: (VoidHandler?).self)
        }
        
        set { }
        
    }
    

    

    
     func showAlert(cardNumber: String, cardOption: CardOption)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: CardApp/Modules/CardList/Views/CardListView.swift

import Cuckoo
@testable import CardApp

import SnapKit
import UIKit


 class MockCardListViewProtocol: CardListViewProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = CardListViewProtocol
    
     typealias Stubbing = __StubbingProxy_CardListViewProtocol
     typealias Verification = __VerificationProxy_CardListViewProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: CardListViewProtocol?

     func enableDefaultImplementation(_ stub: CardListViewProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     var presenter: CardListPresenterProtocol? {
        get {
            return cuckoo_manager.getter("presenter",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.presenter)
        }
        
        set {
            cuckoo_manager.setter("presenter",
                value: newValue,
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.presenter = newValue)
        }
        
    }
    
    
    
     var view: UIView {
        get {
            return cuckoo_manager.getter("view",
                superclassCall:
                    
                    Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                    ,
                defaultCall: __defaultImplStub!.view)
        }
        
    }
    

    

    
    
    
     func presentModel(cards: [CardListModel])  {
        
    return cuckoo_manager.call("presentModel(cards: [CardListModel])",
            parameters: (cards),
            escapingParameters: (cards),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.presentModel(cards: cards))
        
    }
    
    
    
     func animateView()  {
        
    return cuckoo_manager.call("animateView()",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.animateView())
        
    }
    

	 struct __StubbingProxy_CardListViewProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var presenter: Cuckoo.ProtocolToBeStubbedOptionalProperty<MockCardListViewProtocol, CardListPresenterProtocol> {
	        return .init(manager: cuckoo_manager, name: "presenter")
	    }
	    
	    
	    var view: Cuckoo.ProtocolToBeStubbedReadOnlyProperty<MockCardListViewProtocol, UIView> {
	        return .init(manager: cuckoo_manager, name: "view")
	    }
	    
	    
	    func presentModel<M1: Cuckoo.Matchable>(cards: M1) -> Cuckoo.ProtocolStubNoReturnFunction<([CardListModel])> where M1.MatchedType == [CardListModel] {
	        let matchers: [Cuckoo.ParameterMatcher<([CardListModel])>] = [wrap(matchable: cards) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCardListViewProtocol.self, method: "presentModel(cards: [CardListModel])", parameterMatchers: matchers))
	    }
	    
	    func animateView() -> Cuckoo.ProtocolStubNoReturnFunction<()> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockCardListViewProtocol.self, method: "animateView()", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_CardListViewProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var presenter: Cuckoo.VerifyOptionalProperty<CardListPresenterProtocol> {
	        return .init(manager: cuckoo_manager, name: "presenter", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	    
	    var view: Cuckoo.VerifyReadOnlyProperty<UIView> {
	        return .init(manager: cuckoo_manager, name: "view", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func presentModel<M1: Cuckoo.Matchable>(cards: M1) -> Cuckoo.__DoNotUse<([CardListModel]), Void> where M1.MatchedType == [CardListModel] {
	        let matchers: [Cuckoo.ParameterMatcher<([CardListModel])>] = [wrap(matchable: cards) { $0 }]
	        return cuckoo_manager.verify("presentModel(cards: [CardListModel])", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func animateView() -> Cuckoo.__DoNotUse<(), Void> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("animateView()", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class CardListViewProtocolStub: CardListViewProtocol {
    
    
     var presenter: CardListPresenterProtocol? {
        get {
            return DefaultValueRegistry.defaultValue(for: (CardListPresenterProtocol?).self)
        }
        
        set { }
        
    }
    
    
     var view: UIView {
        get {
            return DefaultValueRegistry.defaultValue(for: (UIView).self)
        }
        
    }
    

    

    
     func presentModel(cards: [CardListModel])   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
     func animateView()   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

