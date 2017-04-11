//
//  WorkoutDetailTVC.swift
//  TestingNavigation
//
//  Created by Patrick J. Houle on 4/10/17.
//  Copyright © 2017 Patrick J. Houle. All rights reserved.
//

import UIKit

class WorkoutDetailTVC: UITableViewController {
    
    
    //Then use a Structure to pass data... setup bogus data until using CoreData
    var workoutDetails = [
        WorkoutDetail(myExerciseId: 1, myExercise: "Upper Chest", myPrimary: 1, mySecondary: 1, myReps: "5", mySets: "5", myWeight: "30#", myNotes: "None"),
        WorkoutDetail(myExerciseId: 2, myExercise: "Lower Chest", myPrimary: 1, mySecondary: 1, myReps: "5", mySets: "5", myWeight: "30#", myNotes: "None")
    ]
    
    //Property which holds the selected Exercise
    var selWorkoutHeader : (workout : WorkoutHeader?, index: Int?)
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return workoutDetails.count
    }

    
}
