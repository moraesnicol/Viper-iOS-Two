//
//  LiveNewsInteractor.swift
//  Viper-iOS-Two
//
//  Created by Gabriel on 13/07/21.
//

import Foundation

class LiveNewsInteractor: LiveNewsPresenterToInteractorProtocol {
    var presenter: LiveNewsInteractorToPresenterProtocol?
    
    var news: [LiveNewsModel]?
    
    func fetchLiveNews() {
        //fetch api code
        
    }
    
    
}
