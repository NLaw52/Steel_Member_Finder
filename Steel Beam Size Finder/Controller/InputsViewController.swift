//
//  InputMeasurements.swift
//  Steel Beam Size Finder
//
//  Created by Nathaniel Law on 2/23/23.
//

import UIKit

class InputsViewController: UIViewController {
    
    var finderBrain = FinderBrain()
    
    @IBOutlet weak var dTextField: UITextField!
    @IBOutlet weak var bTextField: UITextField!
    @IBOutlet weak var tfTextField: UITextField!
    @IBOutlet weak var twTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Update the navigation bar title according to the shape selected
        self.title = getSelectedShape()
    }
    
    
    @IBAction func findButtonPressed(_ sender: UIButton) {
        
        let dInput = Float(dTextField.text!) ?? 0
        let bInput = Float(bTextField.text!) ?? 0
        let tfInput = Float(tfTextField.text!) ?? 0
        let twInput = Float(twTextField.text!) ?? 0
//        print("\(dInput), \(bInput), \(tfInput), \(twInput)")
        
        finderBrain.findSizes(d: dInput, b: bInput, tf: tfInput, tw: twInput)
        
        performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    // Upon pressing the "find" button, prepare the results page by sending the necessary info to the results page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.matches = finderBrain.getMatches()
        }
    }
}
