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
    
    //Use Structure to hold data;   NOTE: Replace myDate with Date in WorkoutHeader using string now for ease
    //This will eventually be an empty array structure filled by CoreData on Load
    var workouts = [
        WorkoutHeader(myName : "Chest", myDate : "Mon Mar 1"),
        WorkoutHeader(myName : "Back", myDate : "Tue Mar 2"),
        WorkoutHeader(myName : "Legs", myDate : "Wed Mar 3"),
        WorkoutHeader(myName : "Core", myDate : "Thu Mar 4"),
        WorkoutHeader(myName : "Chest", myDate : "Fri Mar 5"),
        WorkoutHeader(myName : "Arms", myDate : "Sat Mar 6")
        ]
    
    //Property which holds the selected Exercise
    var selWorkoutHeader : (WorkoutHeader?, index: Int?)
    
    
    
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
        return workouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //Represents each individual cell row in the table view
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDefault", for: indexPath)
        cell.textLabel?.text = workouts[indexPath.row].name
        cell.detailTextLabel?.text = workouts[indexPath.row].date
        strSelectedName = (cell.textLabel?.text)!

        
        
        return cell
    }
    
    
    //FUNCTION For Row Selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Sets the class Property selExercise
        selWorkoutHeader = (workouts[indexPath.row], indexPath.row)
        
        //Opens the AddExerciseVC and sends over data...
        performSegue(withIdentifier: "segueDetailTable", sender: self)
        
    }
    
    
    //Allows Editing & Deleting of Rows in Table
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //Sets up DELETING of a row in a Table
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete{
            workouts.remove(at: indexPath.row)
            
            //FOR CordData need to the following code
            //NSKeyedArchiver.archiveRootObject(testData, filePath)
            tableView.deleteRows(at: [indexPath], with: .automatic)   //Removes row from table
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if segue.identifier == "segueDetailTable" {
        //    let detailcontroller = segue.destination as! WorkoutDetailTVC
            
            //detailcontroller.sel = selExercise.exercise
            //detailcontroller.delegate = self
            
        //}
    }

       
    
}
