//
//  ViewController.swift
//  Todoey
//
//  Created by Muhammad Qureshi on 28/04/2019.
//  Copyright © 2019 com.broq. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

	let itemArray = ["Find motivation", "Stop wasting time", "Feel more fulfilled"]

	override func viewDidLoad() {
		super.viewDidLoad()
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
}

