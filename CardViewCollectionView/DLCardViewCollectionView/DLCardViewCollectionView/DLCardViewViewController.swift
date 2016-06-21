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
  var flowLayout: DLCardViewCollectionViewFlowLayout!
  let cellIdentifier = "cellidentifier"
  var dataSource = [UIColor]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initDatasoruce()
    
    stackLayout = DLCardViewCollectionViewLayout()
    flowLayout = DLCardViewCollectionViewFlowLayout()
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: stackLayout)
    collectionView.dataSource = self
    collectionView.delegate = self
    
    collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    
    
    collectionView.registerClass(DLCardViewCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    //collectionView.backgroundColor = UIColor.blueColor()
    view.addSubview(collectionView)
    
    let tap = UITapGestureRecognizer(target: self, action: #selector(changeLayout))
    collectionView.addGestureRecognizer(tap)
    
  }
  
  private func initDatasoruce() {
    for _ in 0..<10 {
      let color = self.randomColor()
      dataSource.append(UIColor(red: color.cor1, green: color.cor2, blue: color.cor3, alpha: 1.0))
    }
  }
  
  func changeLayout() {
    if collectionView.collectionViewLayout.isKindOfClass(DLCardViewCollectionViewFlowLayout.self) {
      stackLayout.invalidateLayout()
      collectionView.setCollectionViewLayout(stackLayout, animated: true)
    } else {
      flowLayout.invalidateLayout()
      collectionView.setCollectionViewLayout(flowLayout, animated: true)
    }
  }
}

extension DLCardViewViewController: UICollectionViewDataSource {
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  private func randomColor() -> (cor1: CGFloat, cor2: CGFloat, cor3: CGFloat) {
    let cor1: CGFloat = CGFloat(arc4random_uniform(255) + 1) / 255
    let cor2: CGFloat = CGFloat(arc4random_uniform(255) + 1) / 255
    let cor3: CGFloat = CGFloat(arc4random_uniform(255) + 1) / 255
    return (cor1: cor1, cor2: cor2, cor3: cor3)
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath)
    cell.backgroundColor = dataSource[indexPath.item]
    return cell
  }
}

extension DLCardViewViewController: UICollectionViewDelegate {
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    
  }
}
