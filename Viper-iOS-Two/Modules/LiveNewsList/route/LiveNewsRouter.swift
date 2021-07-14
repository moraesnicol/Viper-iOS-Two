//
//  File.swift
//  Viper-iOS-Two
//
//  Created by Gabriel on 13/07/21.
//

import Foundation
import UIKit

class LiveNewsRouter: LiveNewsPresenterToRouterProtocol {
    
    
    static func createModule() -> UIViewController {
        
        let view = LiveNewsViewController()
        let presenter: LiveNewsViewToPresenterProtocol & LiveNewsInteractorToPresenterProtocol = LiveNewsPresenter()
        let interactor: LiveNewsPresenterToInteractorProtocol = LiveNewsInteractor()
        let router: LiveNewsPresenterToRouterProtocol = LiveNewsRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
  
        return view
    }
    
    
}
