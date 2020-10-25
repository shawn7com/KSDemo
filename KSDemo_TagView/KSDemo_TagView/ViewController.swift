//
//  ViewController.swift
//  KSDemo_TagView
//
//  Created by Shawn on 2020/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tagButton = KSTagButton(type: .custom)
        tagButton.setTitle("Add by Code", for: .normal)
        tagButton.frame = CGRect(origin: CGPoint(x: 100, y: 200), size: CGSize(width: 180, height: 30))
        view.addSubview(tagButton)
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
//        let s = sender.isSelected
//        sender.isSelected = !s
    }
    
}

