//
//  ExerciseViewController.swift
//  TestingNavigation
//
//  Created by Patrick J. Houle on 4/9/17.
//  Copyright © 2017 Patrick J. Houle. All rights reserved.
//

import UIKit

class ExerciseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var exerciseTableView: UITableView!
    
    //Then use a Structure to pass data... setup bogus data until using CoreData
    var exercises = [
        ExerciseDetail(myName : "Abs", myPrimary : 0, mySecondary : 0, myDesc : "Great Abs", mySource : "none", mySets : "5", myReps : "10"),
        ExerciseDetail(myName : "Chest", myPrimary : 0, mySecondary : 0, myDesc : "Great chest", mySource : "none", mySets : "5", myReps : "10"),
        ExerciseDetail(myName : "Biceps", myPrimary : 0, mySecondary : 0, myDesc : "Great biceps", mySource : "none", mySets : "5", myReps : "10"),
        ExerciseDetail(myName : "Legs", myPrimary : 0, mySecondary : 0, myDesc : "Great legs", mySource : "none", mySets : "5", myReps : "10"),
        ExerciseDetail(myName : "Back", myPrimary : 0, mySecondary : 0, myDesc : "Great back", mySource : "none", mySets : "5", myReps : "10")
    ]
    
    //Property which holds the selected Exercise
    var selExercise : (exercise : ExerciseDetail?, index: Int?)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        exerciseTableView.dataSource = self
        exerciseTableView.delegate = self
        
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Represents each individual cell row in the table view
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDefault", for: indexPath)
        cell.textLabel?.text = exercises[indexPath.row].name
        cell.detailTextLabel?.text = exercises[indexPath.row].desc
        
        return cell
    }
    
    
    //FUNCTION For Row Selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Sets the class Property selExercise
        selExercise = (exercises[indexPath.row], indexPath.row)
        
        //Opens the AddExerciseVC and sends over data...
        performSegue(withIdentifier: "segueExerciseDetail", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueExerciseDetail" {
            let detailcontroller = segue.destination as! AddExerciseViewController
            //let navcontroller = segue.destination. as! UINavigationController
            //let detailcontroller = navcontroller.topViewController as! AddExerciseViewController
            
            
            detailcontroller.selExercise = selExercise.exercise
            detailcontroller.delegate = self
            
        }
    }
    
}

//Ties into Delegate on DetailVC
extension ExerciseViewController : ExerciseDelegate {
    func updateExercise(exercise: ExerciseDetail) {
        exercises[selExercise.index!] = exercise
        
        self.exerciseTableView.reloadData()
    }
}
