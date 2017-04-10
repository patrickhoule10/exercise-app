//
//  ExerciseDetail.swift
//  TestingNavigation
//
//  Created by Patrick J. Houle on 4/10/17.
//  Copyright © 2017 Patrick J. Houle. All rights reserved.
//

import Foundation

struct ExerciseDetail {
    var name : String?
    var primary : Int?
    var secondary : Int?
    var desc : String?
    var source : String?
    var sets : String?
    var reps : String?
    
    init (myName : String, myPrimary : Int, mySecondary : Int, myDesc : String, mySource : String, mySets : String, myReps : String){
        self.name = myName
        self.primary = myPrimary
        self.secondary = mySecondary
        self.desc = myDesc
        self.source = mySource
        self.sets = mySets
        self.reps = myReps
    }
}
