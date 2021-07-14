//
//  ViewController.swift
//  Viper-iOS-Two
//
//  Created by Gabriel on 13/07/21.
//

import UIKit

class LiveNewsViewController: UIViewController {


    var presenter: LiveNewsViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
    }


}

extension LiveNewsViewController: LiveNewsPresenterToViewProtocol {
    
    func showNews() {
        
    }
    
    func showError() {
       
    }
    
    
}
// View: Class that has all the code to show the app interface to the user and get their responses. Upon receiving a response View alerts the Presenter.

// Presenter: Nucleus of a module. It gets user response from the View and works accordingly. The only class to communicate with all the other components. Calls the router for wire-framing, Interactor to fetch data (network calls or local data calls), view to update the UI.
// Interactor: Has the business logic of an app. e.g if business logic depends on making network calls then it is Interactor’s responsibility to do so.
// Router: Does the wire-framing. Listens from the presenter about which screen to present and executes that.

// Entity: Contains plain model classes used by the Interactor. Below shows a simple diagram of VIPER

