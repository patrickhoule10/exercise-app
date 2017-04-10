//
//  WorkoutsViewController.swift
//  TestingNavigation
//
//  Created by Patrick J. Houle on 4/9/17.
//  Copyright © 2017 Patrick J. Houle. All rights reserved.
//

import UIKit

class WorkoutsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var workoutTableView: UITableView!
    
    var testData = ["Chest Workout", "Back Workout", "Leg Workout"]
    var testDates = ["Mon Mar 1", "Tue Mar 2","Wed Mar 3"]
    
    //Need to figure out how to pass this data as an array into AddWorkoutsVC
    var strSelectedName : String = ""
    var strSelectedDate : Date? = NSDate() as Date
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        workoutTableView.delegate = self
        workoutTableView.dataSource = self
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        //Represents how many sections in the table (see Settings as example)
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //Represents each individual cell row in the table view
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDefault", for: indexPath)
        cell.textLabel?.text = testData[indexPath.row]
        cell.detailTextLabel?.text = testDates[indexPath.row]
        strSelectedName = (cell.textLabel?.text)!
        //strSelectedDate  = cell.detailTextLabel.Text
        
        
        return cell
    }
    
    //Allows Editing & Deleting of Rows in Table
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //Sets up DELETING of a row in a Table
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete{
            testData.remove(at: indexPath.row)
            testDates.remove(at: indexPath.row)
            
            //FOR CordData need to the following code
            //NSKeyedArchiver.archiveRootObject(testData, filePath)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)   //Removes row from table
        }
    }
    
    //When row is Selected, passes data in cell to the AddWorkoutViewController
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "segueAddWorkout", sender: testData[indexPath.row])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //let cell = sender as! UITableViewCell
        let DestVC = segue.destination as! AddWorkoutViewController
        DestVC.WorkoutName = strSelectedName
        DestVC.WorkoutDate = strSelectedDate
        
        
    }
       
    
}
