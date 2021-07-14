//
//  ViewController.swift
//  Viper-iOS-Two
//
//  Created by Gabriel on 13/07/21.
//

import UIKit

class LiveNewsViewController: UIViewController {


    var presenter: LiveNewsViewToPresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        setUpTableView()
    }
    
    private func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "LiveNewsTableViewCell", bundle: .main), forCellReuseIdentifier: "LiveNewsTableViewCell")
    }

}

extension LiveNewsViewController: UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getNewsListCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LiveNewsTableViewCell", for: indexPath) as? LiveNewsListTableViewCell
        let row = indexPath.row
        let news = presenter?.getNews(index: row)
        guard let title = news?.title, let author = news?.author, let description = news?.description else {
            return cell ?? UITableViewCell()
        }
        cell?.setCell(title: title, author: author, description: description)
        return cell ?? UITableViewCell()
    }
}

extension LiveNewsViewController: UITableViewDelegate {
    
}



extension LiveNewsViewController: LiveNewsPresenterToViewProtocol {
    
    func showNews() {
        tableView.reloadData()
        
    }
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching News", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
       
    }
    
    
}
// View: Class that has all the code to show the app interface to the user and get their responses. Upon receiving a response View alerts the Presenter.

// Presenter: Nucleus of a module. It gets user response from the View and works accordingly. The only class to communicate with all the other components. Calls the router for wire-framing, Interactor to fetch data (network calls or local data calls), view to update the UI.
// Interactor: Has the business logic of an app. e.g if business logic depends on making network calls then it is Interactor’s responsibility to do so.
// Router: Does the wire-framing. Listens from the presenter about which screen to present and executes that.

// Entity: Contains plain model classes used by the Interactor. Below shows a simple diagram of VIPER

