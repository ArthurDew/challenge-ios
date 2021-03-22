//
//  BanksViewModel.swift
//  challenge-ios
//
//  Created by Arthur de Wurstemberger on 21/03/2021.
//

import UIKit
import Alamofire

class BanksViewModel {
    var banks: [Resource] = []
    
    func getBanks(completion: @escaping () -> ()) {
        let url = "https://sync.bankin.com/v2/banks?limit=100&client_id=dd6696c38b5148059ad9dedb408d6c84&client_secret=56uolm946ktmLTqNMIvfMth4kdiHpiQ5Yo8lT4AFR0aLRZxkxQWaGhLDHXeda6DZ"
        
        AF.request(url, parameters: nil, headers: ["Bankin-Version": "2018-06-15"]).validate(statusCode: 200 ..< 299).responseJSON { AFdata in

            let decoder = JSONDecoder()

            do {
                let groups = try decoder.decode(Group.self, from: AFdata.data ?? Data())
                self.banks = groups.resources
                completion()
            } catch {
                print(error.localizedDescription)
                print(error)
            }
        }
    }
}
