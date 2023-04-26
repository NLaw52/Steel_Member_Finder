//
//  ResultsViewController.swift
//  Steel Beam Size Finder
//
//  Created by Nathaniel Law on 2/24/23.
//

import UIKit

class ResultsViewController: UITableViewController {
        
    var matches: [Shape]?
    var selectedResult: Shape?
    
    // Load the matches into the tableview cells
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if matches!.count == 0 {
            print("No Matches Found")
        }
        
    }
    
    // Display the number of cells in the table based on the matches found
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if matches!.count == 0 {
            return 1
        } else if matches!.count <= 10 {
            return matches!.count
        } else {                            // Limit the amount of matches to display a max of 10
            return 10
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchCell", for: indexPath)
        
        if matches!.count == 0 {
            cell.textLabel?.text = "No Matches Found"
            cell.detailTextLabel?.text = ""
            tableView.allowsSelection = false       // Disable selection of the cell + table if no matches found
        } else {
            cell.textLabel?.text = matches![indexPath.row].AISC_Manual_Label
            cell.detailTextLabel?.text = String(format: "%.1f", matches![indexPath.row].matchPercentage) + "% Match"
        }
        return cell
    }
    
    // Segue to the results page if a cell is selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedResult = matches![indexPath.row]
//        print(selectedResult)
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    // Set up a prepare function to load the result details once the cell is selected - ensures that the detailed results page displays the correct + corresponding information of the selected member upon clicking the cell (no other way of loading the information before loading the results page)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            let destinationVC = segue.destination as! ResultsDetailViewController
//            print(selectedResult)
            destinationVC.selectedResultDetail = selectedResult
        }
    }
}
