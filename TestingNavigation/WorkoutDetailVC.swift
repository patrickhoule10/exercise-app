//
//  WorkoutDetailVC.swift
//  TestingNavigation
//
//  Created by Patrick J. Houle on 4/10/17.
//  Copyright © 2017 Patrick J. Houle. All rights reserved.
//

import UIKit

//Creates a DELEGATE for passing data back/forth between tableVC & detailVC
//Not exactly sure what this does.
protocol WorkoutDetailDelegate {
    func updateWorkoutDetail(detail: WorkoutDetail)
}

class WorkoutDetailVC: UIViewController {

    
    
    @IBOutlet weak var txtExercise: UITextField!
    @IBOutlet weak var txtPrimary: UITextField!
    @IBOutlet weak var txtSecondary: UITextField!
    @IBOutlet weak var txtSets: UITextField!
    @IBOutlet weak var txtReps: UITextField!
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var txtNotes: UITextView!
    
    //Property which holds the selected car detail being passed into the AddExercise VC
    var selWorkoutDetail : WorkoutDetail!
    var delegate: WorkoutDetailDelegate?    //holds value for saving??
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Do any additional setup after loading the view.
        guard let detail = selWorkoutDetail else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        txtExercise.text = detail.exercise
        //txtPrimary = Int(detail.primary)
        //txtSecondary.text = Int(detail.secondary)
        txtSets.text = detail.sets
        txtReps.text = detail.reps
        txtWeight.text = detail.weight
        txtNotes.text = detail.notes
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
