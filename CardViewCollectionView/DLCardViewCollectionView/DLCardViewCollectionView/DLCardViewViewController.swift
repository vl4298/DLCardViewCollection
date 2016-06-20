//
//  DLCardViewViewController.swift
//  DLCardViewCollectionView
//
//  Created by Dinh Luu on 20/06/2016.
//  Copyright © 2016 Dinh Luu. All rights reserved.
//

import UIKit

class DLCardViewViewController: UIViewController {

  var collectionView: UICollectionView!
  var stackLayout: DLCardViewCollectionViewLayout!
  let cellIdentifier = "cellidentifier"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    stackLayout = DLCardViewCollectionViewLayout()
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: stackLayout)
    collectionView.dataSource = self
    
    collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    //collectionView.backgroundColor = UIColor.blueColor()
    view.addSubview(collectionView)
    
  }
}

extension DLCardViewViewController: UICollectionViewDataSource {
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  private func randomColor() -> (cor1: CGFloat, cor2: CGFloat, cor3: CGFloat) {
    let cor1: CGFloat = CGFloat(arc4random_uniform(255) + 1) / 255
    print(cor1)
    let cor2: CGFloat = CGFloat(arc4random_uniform(255) + 1) / 255
    let cor3: CGFloat = CGFloat(arc4random_uniform(255) + 1) / 255
    return (cor1: cor1, cor2: cor2, cor3: cor3)
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath)
    let color = self.randomColor()
    cell.backgroundColor = UIColor(red: color.cor1, green: color.cor2, blue: color.cor3, alpha: 1.0)
    return cell
  }
}
