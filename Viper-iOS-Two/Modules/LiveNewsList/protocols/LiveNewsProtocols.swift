//
//  LiveNewsProtocols.swift
//  Viper-iOS-Two
//
//  Created by Gabriel on 13/07/21.
//

import Foundation
import UIKit


//  View <--> Presenter  <--> Interactor <--> Entity
//                 |
//               Router


//view <--> presenter

protocol LiveNewsPresenterToViewProtocol: AnyObject {
    func showNews()
    func showError()
}

protocol LiveNewsViewToPresenterProtocol: AnyObject {
    var view: LiveNewsPresenterToViewProtocol? { get set }
    var interactor: LiveNewsPresenterToInteractorProtocol? { get set }
    var router: LiveNewsPresenterToRouterProtocol? { get set }
    
    func updateView()
    func getNewsListCount() -> Int?
    func getNews(index: Int) -> LiveNewsModel?
}

//presenter <--> interactor
protocol LiveNewsInteractorToPresenterProtocol: AnyObject {
    func liveNewsFetched()
    func liveNewsFetchedFailed()
}

protocol LiveNewsPresenterToInteractorProtocol: AnyObject {
    var presenter: LiveNewsInteractorToPresenterProtocol? { get set}
    var news: [LiveNewsModel]? { get }
    
    func  fetchLiveNews()
}

//presenter <--> router
protocol LiveNewsPresenterToRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}

