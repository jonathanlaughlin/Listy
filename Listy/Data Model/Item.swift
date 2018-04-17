//
//  Item.swift
//  Listy
//
//  Created by jlaughli on 4/16/18.
//  Copyright © 2018 Jonathan Laughlin. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
