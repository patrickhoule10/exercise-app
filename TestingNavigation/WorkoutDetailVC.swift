//
//  WorkoutDetailVC.swift
//  TestingNavigation
//
//  Created by Patrick J. Houle on 4/10/17.
//  Copyright © 2017 Patrick J. Houle. All rights reserved.
//

import UIKit

class WorkoutDetailVC: UIViewController {

    @IBOutlet weak var txtExercise: UITextField!
    
    @IBOutlet weak var txtPrimary: UITextField!
    
    @IBOutlet weak var txtSecondary: UITextField!
    
    @IBOutlet weak var txtSets: UITextField!
    
    @IBOutlet weak var txtReps: UITextField!
    
    @IBOutlet weak var txtWeight: UITextField!
    
    @IBOutlet weak var txtNotes: UITextView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
