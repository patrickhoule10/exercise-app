//
//  WorkoutData.swift
//  TestingNavigation
//
//  Created by Patrick J. Houle on 4/10/17.
//  Copyright © 2017 Patrick J. Houle. All rights reserved.
//

import Foundation

struct WorkoutHeader {
    var name : String?
    var date : String?
    
    init (myName: String, myDate : String){
        self.name = myName
        self.date = myDate
    }
    
}
