//
//  Exercises.swift
//  FitExer
//
//  Created by Reinier Galien on 11/03/2019.
//  Copyright © 2019 Reinier. All rights reserved.
//

import Foundation
import RealmSwift

class Exercises: Object {
    @objc dynamic var name : String = ""
    let theExercises = List<ExercisesExplained>()
}
