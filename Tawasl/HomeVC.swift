//
//  HomeVC.swift
//  Tawasl
//
//  Created by Khaled Elfakharany on 5/18/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var menuBtn: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.revealViewController().rearViewRevealWidth = 120
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }

}
