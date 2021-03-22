//
//  BanksViewModel.swift
//  challenge-ios
//
//  Created by Arthur de Wurstemberger on 21/03/2021.
//

import UIKit
import Alamofire

class BanksViewModel {
    var resources: [Resource] = []
    
    func getBanks(completion: @escaping () -> ()) {
        let url = "https://sync.bankin.com/v2/banks?limit=100&client_id=dd6696c38b5148059ad9dedb408d6c84&client_secret=56uolm946ktmLTqNMIvfMth4kdiHpiQ5Yo8lT4AFR0aLRZxkxQWaGhLDHXeda6DZ"
        
        AF.request(url, parameters: nil, headers: ["Bankin-Version": "2018-06-15"]).validate(statusCode: 200 ..< 299).responseJSON { AFdata in

            let decoder = JSONDecoder()

            do {
                let groups = try decoder.decode(Group.self, from: AFdata.data ?? Data())
                self.resources = groups.resources
                self.orderBanks() {
                    completion()
                }
            } catch {
                print(error.localizedDescription)
                print(error)
            }
        }
    }
    
    func orderBanks(completion: () -> ()) {
        let country = String((NSLocale.preferredLanguages[0]).prefix(2))
        var index = 0
        
        for resource in self.resources {
            if resource.country_code!.caseInsensitiveCompare(country) == ComparisonResult.orderedSame {
                self.resources.insert(self.resources.remove(at: index), at: 0)
                completion()
            }
            index = index + 1
        }
        completion()
    }
}
