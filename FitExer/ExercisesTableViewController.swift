//
//  ExercisesTableViewController.swift
//  FitExer
//
//  Created by Reinier Galien on 24/02/2019.
//  Copyright © 2019 Reinier. All rights reserved.
//

import UIKit


struct CategorySections {
    var title : String
}

class ExercisesTableViewController: UITableViewController {
    
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
    }
    

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        let category = fitnessCategories[indexPath.row]
        
        let name = fitnessExercises[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = name
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return fitnessExercises.count
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
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(fitnessExercises[indexPath.section][indexPath.row])
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
}










