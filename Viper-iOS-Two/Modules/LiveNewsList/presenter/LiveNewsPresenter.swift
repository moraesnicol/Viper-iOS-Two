//
//  LiveNewsPresenter.swift
//  Viper-iOS-Two
//
//  Created by Gabriel on 13/07/21.
//

import Foundation

class LiveNewsPresenter: LiveNewsViewToPresenterProtocol {
    
    var view: LiveNewsPresenterToViewProtocol?
    var interactor: LiveNewsPresenterToInteractorProtocol?
    var router: LiveNewsPresenterToRouterProtocol?
    
    func updateView() {
        interactor?.fetchLiveNews()
    }
    
    func getNewsListCount() -> Int? {
        return interactor?.news?.count
    }
    
    func getNews(index: Int) -> LiveNewsModel? {
        return interactor?.news?[index]
    }
}



extension LiveNewsPresenter: LiveNewsInteractorToPresenterProtocol {
    
    func liveNewsFetched() {
        view?.showNews()
    }
    
    func liveNewsFetchedFailed() {
        view?.showError()
    }
    
    
    
}
