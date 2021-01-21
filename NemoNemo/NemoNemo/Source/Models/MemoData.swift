//
//  MemoData.swift
//  NemoNemo
//
//  Created by taehy.k on 2021/01/21.
//

import Foundation
import RealmSwift

class Memo: Object {
    @objc dynamic var content: String = ""
    @objc dynamic var keyword: String = ""
    @objc dynamic var groupColor: String = ""
    @objc dynamic var writeDate: Date = Date()
    @objc dynamic var readCount: Int = 0
}
