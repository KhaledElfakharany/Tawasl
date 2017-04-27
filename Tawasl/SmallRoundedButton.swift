//
//  SmallRoundedButton.swift
//  Tawasl
//
//  Created by Khaled Elfakharany on 4/27/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit

class SmallRoundedButton: UIButton {
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowColor = UIColor.black.cgColor
    }

}
