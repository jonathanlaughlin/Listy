//
//  ViewController.swift
//  Listy
//
//  Created by jlaughli on 4/12/18.
//  Copyright © 2018 Jonathan Laughlin. All rights reserved.
//

import UIKit

class ListyViewController: UITableViewController {
    
    let itemArray = ["a","b","c"]

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListyCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            tableView.deselectRow(at: indexPath, animated: true)

    }

}

