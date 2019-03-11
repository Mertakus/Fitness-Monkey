//
//  ExercisesTableViewController.swift
//  FitExer
//
//  Created by Reinier Galien on 24/02/2019.
//  Copyright © 2019 Reinier. All rights reserved.
//

import UIKit
import RealmSwift

struct CategorySections {
    var title : String
}

class ExercisesTableViewController: UITableViewController {
    
    let realm = try! Realm()
    
    var allExercises: Results<Exercises>?
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let fitnessCategories = [
        CategorySections(title: "Chest"),
        CategorySections(title: "Shoulders"),
        CategorySections(title: "Triceps"),
        CategorySections(title: "Back"),
        CategorySections(title: "Bicep"),
        CategorySections(title: "Legs"),
        CategorySections(title: "Abs")
    ]
    
    let fitnessExercises = [
        ["Bench Press", "Incline Bench Press", "Incline DB Press", "DB Bench Press"],
        ["Overhead Shoulder Press", "Military Press"],
        ["Pushdown", "Overhead Rope Extenstion", "Skullcrusher", "Rope"],
        ["Deadlift", "Close Grip Pulldown", "Seated Row", "Bendley Row"],
        ["EZ Bar Curl", "Preacher Curl", "Hammer Curl"],
        ["Squat", "Glute Ham Raises", "Romanian Deadlift", "Calves"],
        ["Knee Raises", "Abs"]
    ]
    
    let sectionImages: [UIImage] = [#imageLiteral(resourceName: "Chest"), #imageLiteral(resourceName: "Shoulder"), #imageLiteral(resourceName: "Tricep"), #imageLiteral(resourceName: "Back"), #imageLiteral(resourceName: "Bicep"), #imageLiteral(resourceName: "Legs"), #imageLiteral(resourceName: "Abs")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadExercises()
        
    }
    
    func updateExercises() {
        let fitnessExercise = Exercises()
        fitnessExercise.name = "Bench Press"
        
        do {
            try realm.write {
                realm.add(fitnessExercise)
            }
        } catch {
            print("Error Saving The Category \(error)")
        }
        
        tableView.reloadData()
    }
    

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return allExercises?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fitnessExercises[section].count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.red
        
        let image = UIImageView(image: sectionImages[section])
        image.frame = CGRect(x: 5, y: 5, width: 35, height: 35)
        view.addSubview(image)
        
        let label = UILabel()
        let section = self.fitnessCategories[section]
        label.text = section.title
        label.frame = CGRect(x: 45, y: 5, width: 100, height: 35)
        view.addSubview(label)
        
        return view
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath)
        
        cell.textLabel?.text = allExercises?[indexPath.row].name ?? "Not explained yet"
        
        return cell
    }

    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToExplanation", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ExerciseExplainedViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedExercise = allExercises?[indexPath.row]
        }
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    //MARK: - Data Manipulation Methods
    
    func save(exercise: ExercisesExplained) {
        do {
            try realm.write {
                realm.add(exercise)
            }
        } catch {
            print("Error Saving The Category \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadExercises(){
        allExercises = realm.objects(Exercises.self)
        tableView.reloadData()
    }
    
}

//MARK: - Search Bar Methods
extension ExercisesTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        allExercises = allExercises?.filter("name CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "name", ascending: true)
        
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        DispatchQueue.main.sync {
            searchBar.resignFirstResponder()
        }
        
    }
    
}










