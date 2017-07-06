//
//  Utile.swift
//  practice
//
//  Created by SangDo on 2017. 7. 2..
//  Copyright © 2017년 SangDo. All rights reserved.
//

import UIKit

extension Date {
    
    func getCurrentDate() -> String {
        let time = Date.init()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone.autoupdatingCurrent
        return formatter.string(from: time)
    }
}
