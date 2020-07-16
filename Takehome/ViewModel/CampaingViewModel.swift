//
//  CampaingViewModel.swift
//  Takehome
//
//  Created by Yoel Jimenez del Valle on 7/16/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//

import Foundation
class CampainViewModel {
    var dataLoader: DataLoader?
    var data: ResponseCampaing?
    var error: Error?    
    func loadData(completion:@escaping(Bool)->Void){
        dataLoader?.loadData(url: "take_home_sample_feed", params: [:], method: .get, completion: {[weak self] result in
            switch result{
            case .failure(let e):
                self?.error = e
                print(e.localizedDescription)
                completion(false)
            case .success(let d):
                self?.data = try? JSONDecoder().decode(ResponseCampaing.self, from: d)
                completion(true)
            }
        })
    }
    
    func localizedError() -> String{
        return error?.localizedDescription ?? ""
    }
    
}
