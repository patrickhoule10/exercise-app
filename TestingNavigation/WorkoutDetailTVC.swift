//
//  WorkoutDetailTVC.swift
//  TestingNavigation
//
//  Created by Patrick J. Houle on 4/10/17.
//  Copyright © 2017 Patrick J. Houle. All rights reserved.
//

import UIKit

class WorkoutDetailTVC: UITableViewController {
    
    @IBOutlet var workoutListTable: UITableView!
    
    //Then use a Structure to pass data... setup bogus data until using CoreData
    var workoutDetails = [
        WorkoutDetail(myExerciseId: 1, myExercise: "Upper Chest", myPrimary: 1, mySecondary: 1, myReps: "5", mySets: "5", myWeight: "30#", myNotes: "None"),
        WorkoutDetail(myExerciseId: 2, myExercise: "Lower Chest", myPrimary: 1, mySecondary: 1, myReps: "5", mySets: "5", myWeight: "30#", myNotes: "None")
    ]
    
    //Property which holds the selected Exercise
    var selWorkoutHeader : (workout : WorkoutHeader?, index: Int?)  //ties to parent table WOVC
    var selWorkoutDetail : (workoutDetail : WorkoutDetail?, index: Int?) //ties to child table
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return workoutDetails.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //Represents each individual cell row in the table view
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDefault", for: indexPath)
        cell.textLabel?.text = workoutDetails[indexPath.row].exercise
        cell.detailTextLabel?.text = workoutDetails[indexPath.row].weight
        
        
        
        
        return cell
    }
    
    
    //FUNCTION For Row Selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Sets the class Property selExercise
        self.selWorkoutDetail = (workoutDetails[indexPath.row], indexPath.row)
        
        //Opens the AddExerciseVC and sends over data...
        performSegue(withIdentifier: "segueDetailItem", sender: self)
        
    }
    
    
    //Allows Editing & Deleting of Rows in Table
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //Sets up DELETING of a row in a Table
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete{
            workoutDetails.remove(at: indexPath.row)
            
            //FOR CordData need to the following code
            //NSKeyedArchiver.archiveRootObject(testData, filePath)
            tableView.deleteRows(at: [indexPath], with: .automatic)   //Removes row from table
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetailItem" {
            let detailcontroller = segue.destination as! WorkoutDetailVC
            
            //detailcontroller.sel = selExercise.exercise
            //detailcontroller.delegate = self
            
        }
    }
}


//Ties into Delegate on DetailVC
extension WorkoutDetailTVC : WorkoutDetailDelegate {
    func updateWorkoutDetail(detail: WorkoutDetail) {
        workoutDetails[selWorkoutDetail.index!] = detail
        self.workoutListTable.reloadData()
    }
}

