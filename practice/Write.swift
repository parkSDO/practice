//
//  WriteModel.swift
//  practice
//
//  Created by SangDo on 2017. 7. 2..
//  Copyright © 2017년 SangDo. All rights reserved.
//

import UIKit

struct writeList {
    static var list = [Write]()
}

class Write {
    
//    static let sharedInstance = Write()
    
    var title: String?
    var content: String?
    var date: String?
    
    init(){}
    
    //title
    func setTitle(title: String) {
        self.title = title
    }
    
    func getTitle() -> String? {
        return self.title
    }
    
    //content
    func setContent(content: String) {
        self.content = content
    }
    
    func getContent() -> String? {
        return self.content
    }
    
    //date
    func setDate(date: String) {
        self.date = date
    }
    
    func getDate() -> String? {
        return self.date
    }
    
}
