//
//  DLCardViewCollectionViewFlowLayout.swift
//  DLCardViewCollectionView
//
//  Created by Van Luu on 20/06/2016.
//  Copyright © 2016 Dinh Luu. All rights reserved.
//

import UIKit

class DLCardViewCollectionViewFlowLayout: UICollectionViewFlowLayout {

  override init() {
    super.init()
    
    itemSize = CGSize(width: 150, height: 150)
    minimumLineSpacing = 20.0
    minimumInteritemSpacing = 30.0
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
}
