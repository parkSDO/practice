//
//  SuccessViewController.swift
//  practice
//
//  Created by SangDo on 2017. 6. 17..
//  Copyright © 2017년 SangDo. All rights reserved.
//

import UIKit
import Firebase

class SuccessViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var noListText: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var dbRef: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbRef = FIRDatabase.database().reference()
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.dataInit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dataInit() {        
        dbRef.child("list").observeSingleEvent(of: .value, with: { snapshot in
            if !snapshot.exists() {
                self.viewInit()
            }
            if let firebaseDic = snapshot.value as? [String: AnyObject]
            {
                print("!!\(firebaseDic)")
//                print(firebaseDic["01"].valueForkey("title"))
                print(firebaseDic["01"]?.value(forKey: "title")!)
                for i in 0..<firebaseDic.count {
                    
                }
            }
            self.viewInit()
        })
    }
    
    func viewInit() {
        let listCount = writeList.list.count
        if listCount > 0 {
            tableView.isHidden = false
            noListText.isHidden = true
        } else {
            tableView.isHidden = true
            noListText.isHidden = false
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let listCount = writeList.list.count
        if listCount > 0 {
            return listCount
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:tableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! tableViewCell
        return cell
    }
    
    @IBAction func clickBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickWriteButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WriteViewController") as! WriteViewController
        self.present(vc, animated: true, completion: nil)
    }

}
