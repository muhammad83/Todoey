//
//  ViewController.swift
//  Todoey
//
//  Created by Muhammad Qureshi on 28/04/2019.
//  Copyright © 2019 com.broq. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

	var itemArray = ["Find motivation", "Stop wasting time", "Feel more fulfilled"]

	let defaults = UserDefaults.standard

	override func viewDidLoad() {
		super.viewDidLoad()

		if let items = defaults.array(forKey: "TodoListArray") as? [String]{
			itemArray = items
		}
		// Do any additional setup after loading the view.
	}

	//MARK - Tableview Datasource Methods

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
		cell.textLabel?.text = itemArray[indexPath.row]
		return cell
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return itemArray.count
	}

	//MARK - TableView Delegate Methods

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print(itemArray[indexPath.row])

		if (tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark){
			tableView.cellForRow(at: indexPath)?.accessoryType = .none
		} else {
			tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
		}


		tableView.deselectRow(at: indexPath, animated: true)
	}

	// MARK - Add New Items
	@IBAction func addbuttonPressed(_ sender: UIBarButtonItem) {

		var placeHolder = UITextField()

		let alert = UIAlertController(title: "Add new item", message: "whats the new item you want to add", preferredStyle: .alert)

		let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
			//what will happen once the user clicks the Add item button on our UIAlert
			self.itemArray.append(placeHolder.text!)

			self.defaults.set(self.itemArray, forKey: "TodoListArray")

			self.tableView.reloadData()
		}

		alert.addTextField { (alertTextField) in
			alertTextField.placeholder = "Create new item"
			placeHolder = alertTextField
			print(alertTextField)
		}

		alert.addAction(action)

		present(alert, animated: true, completion: nil)
	}

}

