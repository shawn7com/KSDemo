//
//  KSTagView.swift
//  KSDemo_TagView
//
//  Created by Shawn on 2020/10/22.
//

import UIKit



class KSTagView: UIView {
    var tags = ["a", "good day", "To be or not to be, that is a question! do you agree!", "hello","a", "good day", "To be or not to be, that is a question! do you agree!", "hello","a", "good day", "To be or not to be, that is a question! do you agree!", "hello"]
    var collectionView: UICollectionView? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initUI()
    }
    
    func initUI() {
        let layout =  CenterAlignedCollectionViewFlowLayout()//AlignedCollectionViewFlowLayout(horizontalAlignment: .leading, verticalAlignment: .center)//DGCollectionViewLeftAlignFlowLayout()//UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 6
        layout.minimumInteritemSpacing = 12
        layout.estimatedItemSize = CGSize(width: 20, height: 16)
        
        collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "rcid_tag_cell")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.alwaysBounceVertical = true
        
        addSubview(collectionView!)
        
        NSLayoutConstraint(item: collectionView!, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: collectionView!, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: collectionView!, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: collectionView!, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true

    }
}


extension KSTagView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "rcid_tag_cell", for: indexPath)
        
        let tagButton: KSTagButton
        if cell.contentView.subviews.count == 0 {
            tagButton = KSTagButton.init()
            tagButton.translatesAutoresizingMaskIntoConstraints = false
            tagButton.setContentCompressionResistancePriority(.init(500), for: .horizontal)
            cell.addSubview(tagButton)
            
            NSLayoutConstraint(item: cell, attribute: .top, relatedBy: .equal, toItem: tagButton, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
            NSLayoutConstraint(item: cell, attribute: .bottom, relatedBy: .equal, toItem: tagButton, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
            NSLayoutConstraint(item: cell, attribute: .leading, relatedBy: .equal, toItem: tagButton, attribute: .leading, multiplier: 1.0, constant: 0.0).isActive = true
            NSLayoutConstraint(item: cell, attribute: .trailing, relatedBy: .equal, toItem: tagButton, attribute: .trailing, multiplier: 1.0, constant: 0.0).isActive = true
//             NSLayoutConstraint(item: tagButton, attribute: .width, relatedBy: .lessThanOrEqual, toItem: collectionView, attribute: .width, multiplier: 1.0, constant: 0.0).isActive = true
        } else {
            tagButton = cell.contentView.subviews.first as! KSTagButton
        }
        let tag = tags[indexPath.row]
        tagButton.setTitle(tag, for: .normal)
        
        return cell
    }
    
    
}
