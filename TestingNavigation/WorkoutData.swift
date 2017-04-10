//
//  WorkoutData.swift
//  TestingNavigation
//
//  Created by Patrick J. Houle on 4/10/17.
//  Copyright © 2017 Patrick J. Houle. All rights reserved.
//

import Foundation

struct Workout {
    var workoutName : String?
    var workoutDate : Date?
    
    init (name: String, workoutdate : Date){
        self.workoutName = name
        self.workoutDate = workoutdate
    }
    
}
