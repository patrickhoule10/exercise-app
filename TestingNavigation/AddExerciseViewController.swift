//
//  AddExerciseViewController.swift
//  TestingNavigation
//
//  Created by Patrick J. Houle on 4/9/17.
//  Copyright © 2017 Patrick J. Houle. All rights reserved.
//

import UIKit

//Not exactly sure what this does.
protocol ExerciseDelegate {
    func updateExercise(exercise: ExerciseDetail)
}

class AddExerciseViewController: UIViewController {

    @IBOutlet weak var txtSource: UITextField!
    @IBOutlet weak var txtDesc: UITextView!
    @IBOutlet weak var txtReps: UITextField!
    @IBOutlet weak var txtSets: UITextField!
    @IBOutlet weak var txtSecondary: UITextField!
    @IBOutlet weak var txtPrimary: UITextField!
    @IBOutlet weak var txtName: UITextField!
    //Assign references to fields on ViewController

    
    //Property which holds the selected car detail being passed into the AddExercise VC
    var selExercise : ExerciseDetail!
    var delegate: ExerciseDelegate?    //holds value for saving??
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        //Do any additional setup after loading the view.
        guard let detail = selExercise else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        txtName.text = detail.name
        //txtPrimary.text = Int(detail.primary)
        //txtSecondary.text = Int(detail.secondary)
        txtSets.text = detail.sets
        txtReps.text = detail.reps
        txtDesc.text = detail.desc
        txtSource.text = detail.source

    }
    
    
    @IBAction func btnSave(_ sender: Any) {
        
        selExercise.name        = txtName.text
        //selExercise.primary     = Int(txtPrimary.text)!
        //selExercise.secondary   = Int(txtSecondary.text)!
        selExercise.sets        = txtSets.text
        selExercise.reps        = txtReps.text
        selExercise.desc        = txtDesc.text
        selExercise.source      = txtSource.text
        
        delegate?.updateExercise(exercise: selExercise)
        self.dismiss(animated: true, completion: nil)
    }
       
      
}
