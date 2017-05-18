//
//  ViewController.swift
//  Tawasl
//
//  Created by Khaled Elfakharany on 4/27/17.
//  Copyright © 2017 Khaled Elfakharany. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var pwdField: UITextField!

    @IBOutlet weak var topView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                print("KHALED: \((FIRAuth.auth()?.currentUser?.displayName)!)")
            }
            
        }
    }
    
    @IBAction func signInPressed(_ sender: Any) {
        if let email = emailField.text, let pw = pwdField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pw, completion: { (user,error) in
                if error == nil {
                    print("Khaled: Email authenticated with Firebase")
//                    let changeRequest = FIRAuth.auth()?.currentUser?.profileChangeRequest()
//                    changeRequest?.displayName = "Khaloda"
//                    changeRequest?.commitChanges() { (error) in
//                        // ...
//                    }
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "ContentScreen") as! SWRevealViewController
                    self.present(vc, animated: true, completion: nil)
                    print("KHALED: \((user?.displayName)!)")
                }else{
                    FIRAuth.auth()?.createUser(withEmail: email, password: pw, completion: { (user,error) in
                        if error != nil {
                            print("Khaled: somthing wrong with email or password")
                        }else {
                            print("Khaled: Successfuly signed up")
                        }
                    })
                }
            })
        }
    }
}

