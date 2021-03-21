//
//  BanksViewController.swift
//  challenge-ios
//
//  Created by Arthur de Wurstemberger on 21/03/2021.
//

import UIKit

class BanksViewController : UIViewController {
    var viewModel: BanksViewModel?
    
    var mainView: UIView!
    let tableView = UITableView()
    
    override func viewDidLoad() {
        self.setup()
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setup() {
        let main = UIView(frame: self.view.frame)
        self.mainView = main
        self.view.addSubview(mainView)
        mainView.backgroundColor = .white
        mainView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        mainView.translatesAutoresizingMaskIntoConstraints = false
    }
}
