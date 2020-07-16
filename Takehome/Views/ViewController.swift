//
//  ViewController.swift
//  Takehome
//
//  Created by Yoel Jimenez del Valle on 7/15/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    
    let viewModel = CampainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    
    func showAlert(){
        let alert = UIAlertController(title: "Ups!", message: viewModel.localizedError(), preferredStyle: .alert)
        let action = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        let retry = UIAlertAction(title: "Reintentar", style: .default, handler: {_ in
            self.loadData()
        })
        alert.addAction(action)
        alert.addAction(retry)
        self.present(alert, animated: true, completion: nil)
    }
    
    func loadData(){
        viewModel.loadData(completion: {[weak self] val in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.table.reloadData()
                if !val{
                    self.showAlert()
                }
            }
        })
    }
}

