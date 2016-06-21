//
//  DLCardViewCollectionViewLayout.swift
//  DLCardViewCollectionView
//
//  Created by Dinh Luu on 20/06/2016.
//  Copyright © 2016 Dinh Luu. All rights reserved.
//

import UIKit

class DLCardViewCollectionViewLayout: UICollectionViewLayout {

  let itemGap: CGFloat = 10.0
  let itemSize: CGFloat = 150.0
  let numVisibleItems = 4
  var yOrigin: CGFloat = 200.0
  let xOrigin: CGFloat = 20.0
  var translate: CGFloat = 20.0
  var scale: CGFloat = 0.9
  var attributes = [UICollectionViewLayoutAttributes]()
  
  override func prepareLayout() {
    super.prepareLayout()
    if attributes.count > 0 {
      return
    }
    
    let numItems = collectionView!.numberOfItemsInSection(0)
    var transform = CATransform3DIdentity
    transform.m34 = -1/5000
    for index in 0..<numItems {
      let indexPath = NSIndexPath(forItem: index, inSection: 0)
      let attribute = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
      attribute.frame = CGRect(x: xOrigin, y: yOrigin, width: itemSize, height: itemSize)
      transform = CATransform3DScale(CATransform3DIdentity, scale, scale , 1)
      attribute.transform3D = transform
      attribute.zIndex = 0 - index
      translate += 20.0
      yOrigin -= 20.0
      scale -= 0.1
      
      attributes.append(attribute)
    }
  }
  
  override func collectionViewContentSize() -> CGSize {
    return CGSize(width: collectionView!.bounds.width, height: collectionView!.bounds.height)
  }
  
  override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    return attributes
  }
  
  override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
    return attributes[indexPath.item]
  }
  
}
