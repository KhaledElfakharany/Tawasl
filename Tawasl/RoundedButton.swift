//
//  RoundedButton.swift
//  Tawasl
//
//  Created by Khaled Elfakharany on 4/27/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
        layer.cornerRadius = self.frame.width/2
        imageView?.contentMode = .scaleAspectFit
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0 , height: 2)
        layer.shadowOpacity = 0.6
    }

}
