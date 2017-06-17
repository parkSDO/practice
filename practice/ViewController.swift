//
//  ViewController.swift
//  practice
//
//  Created by SangDo on 2017. 6. 8..
//  Copyright © 2017년 SangDo. All rights reserved.

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    var dbRef: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbRef = FIRDatabase.database().reference()
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
     
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickLogin(_ sender: Any) {
        if name.text == "" || pass.text == "" {
            let alert = UIAlertController(title: "입력해주세요", message: "", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        let userId = name.text!
        let password = pass.text!
        dbRef.child("user").child(userId).observeSingleEvent(of: .value, with: { snapshot in
            if !snapshot.exists() {
                let alert = UIAlertController(title: "사용자가 없습니다.", message: "", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            if let firebaseDic = snapshot.value as? [String: AnyObject]
            {
                let dbId = firebaseDic["name"]
                let dbPass = firebaseDic["pass"]
                if dbId as? String == userId {
                    if dbPass as? String == password {
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SuccessViewController") as! SuccessViewController
                        self.present(vc, animated: true, completion: nil)
                    } else {
                        let alert = UIAlertController(title: "비밀번호가 맞지 않습니다.", message: "", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        return
                    }
                }
            }
        })
    }
    
    //google Login
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print("success")
    }
    
}

