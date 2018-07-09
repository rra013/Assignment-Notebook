//
//  MasterViewController.swift
//  Assignment Notebook
//
//  Created by Rishi Anand on 7/9/18.
//  Copyright © 2018 Rishi Anand. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var assignments = [Assignment]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc
    func insertNewObject(_ sender: Any) {
        let alert = UIAlertController(title: "Add Assignment", message: nil, preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Class"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Description"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Due Date"
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        let insertAction = UIAlertAction(title: "Insert", style: .default){ (action) in
            let nameTextField = alert.textFields![0] as UITextField
            let classTextField = alert.textFields![1] as UITextField
            let descTextField = alert.textFields![2] as UITextField
            let dueDateTextField = alert.textFields![3] as UITextField
            if (nameTextField.text != nil && classTextField.text != nil && descTextField.text != nil && dueDateTextField.text != nil){
                let assignmentToAdd = Assignment(name: nameTextField.text!, className: classTextField.text!, description: descTextField.text!, dueDate: /*formatter.date(from: */Int(dueDateTextField.text!)!/*!)!*/)
                self.assignments.append(assignmentToAdd)
                self.tableView.reloadData()
            }
        }
        alert.addAction(insertAction)
        present(alert, animated: true, completion: nil)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = assignments[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                print(object.name)
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignments.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = assignments[indexPath.row]
        cell.textLabel!.text = object.name
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            assignments.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//            tableView.beginUpdates()
//            tableView.insertRows(at: [
//                NSIndexPath(row: assignments.count-1, section: 0) as IndexPath
//                ], with: .automatic)
//            tableView.endUpdates()

        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let objectToMove = assignments.remove(at: sourceIndexPath.row)
        assignments.insert(objectToMove, at: destinationIndexPath.row)
    }


}

