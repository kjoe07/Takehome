//
//  TableViewCell.swift
//  Takehome
//
//  Created by Yoel Jimenez del Valle on 7/15/20.
//  Copyright © 2020 Yoel Jimenez del Valle. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
    }

}
