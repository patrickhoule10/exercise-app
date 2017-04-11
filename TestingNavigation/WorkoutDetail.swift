//
//  WorkoutDetail.swift
//  TestingNavigation
//
//  Created by Patrick J. Houle on 4/10/17.
//  Copyright © 2017 Patrick J. Houle. All rights reserved.
//

import Foundation

struct WorkoutDetail {
    var exerciseId : Int?
    var exercise : String?
    var primary : Int?
    var secondary : Int?
    var reps : String?
    var sets : String?
    var weight : String?
    var notes : String?
    
    
    init (myExerciseId : Int, myExercise : String, myPrimary : Int, mySecondary : Int, myReps : String, mySets : String, myWeight : String, myNotes : String){
        self.exerciseId = myExerciseId
        self.exercise = myExercise
        self.primary = myPrimary
        self.secondary = mySecondary
        self.reps = myReps
        self.sets = mySets
        self.weight = myWeight
        self.notes = myNotes
    }
    
}
