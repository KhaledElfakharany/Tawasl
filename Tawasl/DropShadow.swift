//
//  DropShadow.swift
//  Tawasl
//
//  Created by Khaled Elfakharany on 4/27/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import Foundation

import UIKit

protocol DropShadow{}

extension DropShadow where Self : UIView {
    func addDropShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 0.7
    }
}
