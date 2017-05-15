//
//  ViewController.swift
//  Tawasl
//
//  Created by Khaled Elfakharany on 4/27/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase

class SignInVC: UIViewController {

    @IBOutlet weak var topView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func facebookBtnPressed(_ sender: Any) {
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self){ (result,error) in
            if error != nil {
                print("Khaled:  Unable to authonticate with Facebook - \(String(describing: error))")
            }else if result?.isCancelled == true {
                print("Khaled: User cancelled Facebook authentication")
            }else {
                print("Khaled: Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
            
        }
    }
    
    func firebaseAuth( _ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential){ (user,error) in
            if error != nil {
                print("Khaled:  Unable to authonticate with FireBase - \(String(describing: error))")
            }else {
                print("Khaled: Successfully authenticated with FireBase")
            }
        }
    }
}

