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

class WorkoutDetailVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    
    
    @IBOutlet weak var txtExercise: UITextField!
    @IBOutlet weak var txtPrimary: UITextField!
    @IBOutlet weak var txtSecondary: UITextField!
    @IBOutlet weak var txtSets: UITextField!
    @IBOutlet weak var txtReps: UITextField!
    @IBOutlet weak var txtWeight: UITextField!
    @IBOutlet weak var txtNotes: UITextView!
    @IBOutlet weak var pickPrimary: UIPickerView!
    
    //Property which holds the selected car detail being passed into the AddExercise VC
    var selWorkoutDetail : WorkoutDetail!
    var delegate: WorkoutDetailDelegate?    //holds value for saving??
    
    //picklist demo data
    var pickPrimaryList = ["Arms","Back","Chest","Legs","Shoulders"]

    
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

    
    //Add REQUIRED picklist functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickPrimaryList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return pickPrimaryList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.txtPrimary.text = pickPrimaryList[row]
        self.pickPrimary.isHidden = true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == self.txtPrimary {
            self.pickPrimary.isHidden = false
            txtPrimary.endEditing(true)
        }
    }

}
