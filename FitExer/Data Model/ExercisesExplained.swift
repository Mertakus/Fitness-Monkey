//
//  ExercisesExplained.swift
//  FitExer
//
//  Created by Reinier Galien on 11/03/2019.
//  Copyright © 2019 Reinier. All rights reserved.
//

import Foundation
import RealmSwift

class ExercisesExplained: Object {
    var image = UIImage()
    var text : String = ""
    var parentExercise = LinkingObjects(fromType: Exercises.self, property: "theExercises")
}

//This essentially defines the forward relationship, i.e. inside each Exercise there's this thing calles
//ExercisesExplained that's going to point to a list of Exercise objects.
