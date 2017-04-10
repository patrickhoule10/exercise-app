//
//  AddWorkoutViewController.swift
//  TestingNavigation
//
//  Created by Patrick J. Houle on 4/9/17.
//  Copyright © 2017 Patrick J. Houle. All rights reserved.
//

import UIKit

class AddWorkoutViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var dtmWorkoutDate: UIDatePicker!
    
    var WorkoutName : String  = ""
    var WorkoutDate : Date? = NSDate() as Date
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtName.text = WorkoutName
        dtmWorkoutDate.date = WorkoutDate!
        
    }

    
}
