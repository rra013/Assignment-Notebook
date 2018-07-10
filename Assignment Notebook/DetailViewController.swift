//
//  DetailViewController.swift
//  Assignment Notebook
//
//  Created by Rishi Anand on 7/9/18.
//  Copyright © 2018 Rishi Anand. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var classLabel: UITextField!
    @IBOutlet weak var descriptionLabel: UITextField!
    
    @IBOutlet weak var dateSelector: UIDatePicker!
    
    var detailItem: Assignment? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let assignment = detailItem {
            if nameLabel != nil{
                nameLabel.text = assignment.name
                classLabel.text = assignment.className
                descriptionLabel.text = assignment.description
                dateSelector.date = assignment.dueDate
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let assignment = self.detailItem{
            assignment.name = nameLabel.text!
            assignment.className = classLabel.text!
            assignment.description = descriptionLabel.text!
            assignment.dueDate = dateSelector.date
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

