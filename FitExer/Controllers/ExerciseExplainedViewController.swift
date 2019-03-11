//
//  ExerciseExplainedViewController.swift
//  FitExer
//
//  Created by Reinier Galien on 10/03/2019.
//  Copyright © 2019 Reinier. All rights reserved.
//

import UIKit
import RealmSwift

class ExerciseExplainedViewController: UITableViewController {
    
    var theExercisesExplained: Results<ExercisesExplained>?
    
    let realm = try! Realm()
    
    var selectedExercise : Exercises? {
        didSet {
            loadExercisesExplanations()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theExercisesExplained?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
       
        if let explanation = theExercisesExplained?[indexPath.row] {
            
            cell.textLabel?.text = explanation.text
        }
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       if let explanation = theExercisesExplained?[indexPath.row] {
            do {
                try realm.write {
                    
                }
            } catch {
                print("Error saving done status, \(error)")
            }
        }
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    //MARK: - Data Manipulation Methods
    
    func save(explained: ExercisesExplained) {
        do {
            try realm.write {
                realm.add(explained)
            }
        } catch {
            print("Error Saving The Category \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadExercisesExplanations(){
        theExercisesExplained = selectedExercise?.theExercises.sorted(byKeyPath: "text", ascending: true)

        tableView.reloadData()
    }

}


//vraag in de VA van les 245 wat de best practice zou zijn om het doel van deze app te behalen.
