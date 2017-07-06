//
//  WriteViewController.swift
//  practice
//
//  Created by SangDo on 2017. 7. 2..
//  Copyright © 2017년 SangDo. All rights reserved.
//

import UIKit
import Firebase

class WriteViewController: UIViewController {
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var content: UITextView!
    
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
    
    @IBAction func clickOkButton(_ sender: Any) {
        if (titleText.text == "") || (content.text == "") {
            return
        } else {
            var count = "1"
            dbRef.child("list").observeSingleEvent(of: .value, with: { snapshot in
                if !snapshot.exists() {
                    print("없음")
                }
                if let firebaseDic = snapshot.value as? [String: AnyObject]
                {
                    print("********")
                    count = String(firebaseDic.count + 1)
                }
                print("count \(count)")
                
                let writeDate = ["title": self.titleText.text!, "content": self.content.text!]
                self.dbRef.child("list/0\(count)").setValue(writeDate)
                
            })
            let write = Write()
            write.setTitle(title: titleText.text!)
            write.setContent(content: content.text)
            write.setDate(date: Date().getCurrentDate())
            writeList.list.append(write)
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func clickCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
