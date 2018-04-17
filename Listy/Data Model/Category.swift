//
//  Category.swift
//  Listy
//
//  Created by jlaughli on 4/16/18.
//  Copyright © 2018 Jonathan Laughlin. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
