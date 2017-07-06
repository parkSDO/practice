//
//  JoinViewController.swift
//  practice
//
//  Created by SangDo on 2017. 6. 10..
//  Copyright © 2017년 SangDo. All rights reserved.
//

import UIKit
import Firebase

class JoinViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    var dbRef: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbRef = FIRDatabase.database().reference()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickJoinButton(_ sender: Any) {
        if (name.text == "") || (pass.text == "") {
            return
        } else {
            let person = ["name": name.text!, "pass": pass.text!]
            dbRef.child("user/\(name.text!)").setValue(person)
            self.dismiss(animated: true, completion: {})
        }
    }
}
