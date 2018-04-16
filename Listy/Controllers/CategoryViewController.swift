//
//  CategoryViewController.swift
//  Listy
//
//  Created by jlaughli on 4/12/18.
//  Copyright © 2018 Jonathan Laughlin. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    // initializes the array and explicitly types it to avoid errors.
    var categories = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()

    }
    
    //MARK: Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row].name
        
        return cell
        
    }
    
    //MARK: Tabvleview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ListyViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[indexPath.row]
        }
    }

    
    //MARK: Data Manipulation Methods
    
    func saveCategories() {
        do {
            try context.save()
        } catch {
            print("ERROR saving context: \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadCategories() {
        let request: NSFetchRequest<Category> = Category.fetchRequest()
        do {
            categories = try context.fetch(request)
        }
        catch {
            print("ERROR fetching data from context \(error)")
        }
        
        tableView.reloadData()
    }

    
    
    //MARK: Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
                var textField = UITextField()
        
                let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
                let action = UIAlertAction(title: "Add category", style: .default) { (action) in
        
                    let newCategory = Category(context: self.context)
                    newCategory.name = textField.text!
        
                    self.categories.append(newCategory)
                    self.saveCategories()
                    //self.tableView.reloadData()
                }
        
                alert.addAction(action)
        
                alert.addTextField { (field) in
                    textField = field
                    textField.placeholder = "Category name"
                }
        
                present(alert, animated: true, completion: nil)
    }
    
}
