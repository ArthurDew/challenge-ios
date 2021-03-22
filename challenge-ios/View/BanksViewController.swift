//
//  BanksViewController.swift
//  challenge-ios
//
//  Created by Arthur de Wurstemberger on 21/03/2021.
//

import UIKit

class BanksViewController : UIViewController, UITableViewDelegate {
    var viewModel: BanksViewModel?
    
    var safeArea: UILayoutGuide!
    let tableView = UITableView()
    
    override func viewDidLoad() {
        self.setup()
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setup() {
        self.view.backgroundColor = .white
        safeArea = self.view.layoutMarginsGuide
        
        self.view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.rowHeight = 60
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeCell.self, forCellReuseIdentifier: "homeCell")
        
        viewModel?.getBanks() {
            self.tableView.reloadData()
        }
    }
}

extension BanksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var totalBanks = 0
        
        for resource in viewModel?.banks ?? [] {
            for parent in resource.parent_banks {
                for _ in parent.banks {
                    totalBanks = totalBanks + 1
                }
            }
        }
        print(totalBanks)
        
        return totalBanks
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeCell
        var index = 0

        for resource in viewModel?.banks ?? [] {
            for parent in resource.parent_banks {
             for bank in parent.banks {
                if index == indexPath.row {
                    cell.set(bank: (bank))
                }
                index = index + 1
              }
            }
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
}
