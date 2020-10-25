//
//  KSTagButton.swift
//  KSDemo_TagView
//
//  Created by Shawn on 2020/10/21.
//

import UIKit

class KSTagButton: UIButton {
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.backgroundColor = UIColor.red
            } else {
                self.backgroundColor = UIColor.clear
            }
        }
    }
    
//    override var frame: CGRect {
//        didSet {
//            self.layer.cornerRadius = frame.size.height / 2.0
//        }
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        
        self.setNeedsLayout()
    }
    
    func initUI() {
        self.contentEdgeInsets = UIEdgeInsets(top: 6, left: 12, bottom: 6, right: 12)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.red.cgColor
        self.setTitleColor(UIColor.red, for: .normal)
        self.setTitleColor(UIColor.white, for: .selected)
        self.clipsToBounds = true
        
        self.addTarget(self, action: #selector(clicked), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = bounds.size.height / 2.0
    }
    
    @objc func clicked() {
        let s = self.isSelected
        self.isSelected = !s
    }

    deinit {
        print("- dealloc: \(self)")
    }
}
