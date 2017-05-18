//
//  Menu.swift
//  Tawasl
//
//  Created by Khaled Elfakharany on 5/18/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit
import Firebase

class Menu: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signedOut(_ sender: Any) {
        do {
            try FIRAuth.auth()?.signOut()
        } catch {
            
        }
    }
}
