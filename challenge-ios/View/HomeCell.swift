//
//  HomeCell.swift
//  challenge-ios
//
//  Created by Arthur de Wurstemberger on 21/03/2021.
//

import UIKit

class HomeCell : UITableViewCell {
    
    var nameLabel = UILabel()
    let logoPicture = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        addSubview(nameLabel)
        addSubview(logoPicture)
        
        configNameLabel()
        configPicture()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(bank: Bank) {
        nameLabel.text = getFlag(from: bank.country_code) + " " + bank.name
        
        if bank.logo_url != "" {
        let url = URL(string: bank.logo_url)

        if let data = try? Foundation.Data(contentsOf: url!) {
            logoPicture.image = UIImage(data: data)!
        }
        } else {
            logoPicture.image = #imageLiteral(resourceName: "default_logo")
        }
    }
    
    func configNameLabel() {
        nameLabel.font = UIFont.init(name: "Futura-medium", size: 15)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: logoPicture.leadingAnchor, constant: -10).isActive = true
    }
    
    func configPicture() {
        logoPicture.contentMode = .scaleAspectFit
        logoPicture.translatesAutoresizingMaskIntoConstraints = false
        logoPicture.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        logoPicture.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        logoPicture.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoPicture.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func getFlag(from country: String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in country.uppercased().unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return s
    }
}
