//
//  ViewController.swift
//  Steel Beam Size Finder
//
//  Created by Nathaniel Law on 2/23/23.
//

import UIKit

private var selectedShape: String = ""

class ShapeListViewController: UITableViewController {
    
    let shapesArray = [
        GeneralShapes(name: "W", description: "Wide-Flange Shapes"),
        GeneralShapes(name: "M", description: "Miscellaneous Beams"),
        GeneralShapes(name: "HP", description: "Bearing Piles"),
        GeneralShapes(name: "S", description: "American Standard Beams"),
        GeneralShapes(name: "C", description: "American Standard Channels"),
        GeneralShapes(name: "MC", description: "Miscellaneous Channels"),
        GeneralShapes(name: "WT", description:  "Wide-Flange Tees"),
        GeneralShapes(name: "MT", description: "Miscellaneous Tees"),
        GeneralShapes(name: "ST", description: "American Standard Tees"),
    ]


    //MARK: - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shapesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShapeCell", for: indexPath)
        cell.textLabel?.text = shapesArray[indexPath.row].name
        cell.detailTextLabel?.text = shapesArray[indexPath.row].description
        return cell
    }
    
    //MARK: - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(shapesArray[indexPath.row].name)
        selectedShape = shapesArray[indexPath.row].name
        
        // Depending on what the selected shape is, send the user to the corresponding input page via the matching segue
        if selectedShape == "W" || selectedShape == "M" || selectedShape == "HP" {
            performSegue(withIdentifier: "goToWInputs", sender: self)
        } else if selectedShape == "S" {
            performSegue(withIdentifier: "goToSInputs", sender: self)
        } else if selectedShape == "C" || selectedShape == "MC" {
            performSegue(withIdentifier: "goToCInputs", sender: self)
        } else if selectedShape == "WT" || selectedShape == "MT" {
            performSegue(withIdentifier: "goToWTInputs", sender: self)
        } else {
            performSegue(withIdentifier: "goToSTInputs", sender: self)
        }
    }
}

// Store and return the user's selected shape
func getSelectedShape() -> String {
    return selectedShape
}

