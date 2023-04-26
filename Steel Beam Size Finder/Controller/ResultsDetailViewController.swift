//
//  ResultsDetailViewController.swift
//  Steel Beam Size Finder
//
//  Created by Nathaniel Law on 2/27/23.
//

import UIKit

class ResultsDetailViewController: UIViewController {
    
    @IBOutlet weak var AISC_Manual_LabelLabel: UILabel!
    @IBOutlet weak var matchPercentage: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var WLabel: UILabel!
    @IBOutlet weak var ALabel: UILabel!
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var dPercentageLabel: UILabel!
    @IBOutlet weak var bfLabel: UILabel!
    @IBOutlet weak var bfPercentageLabel: UILabel!
    @IBOutlet weak var tfLabel: UILabel!
    @IBOutlet weak var tfPercentageLabel: UILabel!
    @IBOutlet weak var twLabel: UILabel!
    @IBOutlet weak var twPercentageLabel: UILabel!
    @IBOutlet weak var b_tLabel: UILabel!
    @IBOutlet weak var h_twLabel: UILabel!
    @IBOutlet weak var IxLabel: UILabel!
    @IBOutlet weak var ZxLabel: UILabel!
    @IBOutlet weak var SxLabel: UILabel!
    @IBOutlet weak var rxLabel: UILabel!
    @IBOutlet weak var IyLabel: UILabel!
    @IBOutlet weak var ZyLabel: UILabel!
    @IBOutlet weak var SyLabel: UILabel!
    @IBOutlet weak var ryLabel: UILabel!
    @IBOutlet weak var IzLabel: UILabel!
    @IBOutlet weak var SzLabel: UILabel!
    @IBOutlet weak var rzLabel: UILabel!
    @IBOutlet weak var JLabel: UILabel!
    
    var selectedResultDetail: Shape?
    
    // Once the page loads display all the corresponding information about the selected shape (not to be mixed up with what the prepare function does in the "ResultsViewController"). This function displays the information that was loaded from the prepare function (doesn't load the data itself)
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(selectedResultDetail)
        
        AISC_Manual_LabelLabel.text = selectedResultDetail!.AISC_Manual_Label
        matchPercentage.text = "(\(String(format: "%0.2f", selectedResultDetail!.matchPercentage))% Match)"

        if selectedResultDetail?.type == "W" || selectedResultDetail?.type == "M" || selectedResultDetail?.type == "HP" {
            resultImage.image = UIImage(named: "I")
        } else if selectedResultDetail?.type == "S" {
            resultImage.image = UIImage(named: "S")
        } else if selectedResultDetail?.type == "C" || selectedResultDetail?.type == "MC" {
            resultImage.image = UIImage(named: "C")
        } else if selectedResultDetail?.type == "WT" || selectedResultDetail?.type == "MT" {
            resultImage.image = UIImage(named: "WT")
        } else {
            resultImage.image = UIImage(named: "ST")
        }
        
        typeLabel.text = selectedResultDetail?.type
        WLabel.text = String(selectedResultDetail!.W)
        ALabel.text = String(selectedResultDetail!.A)
        dLabel.text = String(selectedResultDetail!.d)
        dPercentageLabel.text = "(\(String(format: "%.2f", selectedResultDetail!.dPercentage))% Match)"
        bfLabel.text = String(selectedResultDetail!.bf)
        bfPercentageLabel.text = "(\(String(format: "%.2f", selectedResultDetail!.bfPercentage))% Match)"
        tfLabel.text = String(selectedResultDetail!.tf)
        tfPercentageLabel.text = "(\(String(format: "%.2f", selectedResultDetail!.tfPercentage))% Match)"
        twLabel.text = String(selectedResultDetail!.tw)
        twPercentageLabel.text = "(\(String(format: "%.2f", selectedResultDetail!.twPercentage))% Match)"
        b_tLabel.text = String(selectedResultDetail!.b_t)
        h_twLabel.text = String(selectedResultDetail!.h_tw)
        IxLabel.text = String(selectedResultDetail!.Ix)
        ZxLabel.text = String(selectedResultDetail!.Zx)
        SxLabel.text = String(selectedResultDetail!.Sx)
        rxLabel.text = String(selectedResultDetail!.rx)
        IyLabel.text = String(selectedResultDetail!.Iy)
        ZyLabel.text = String(selectedResultDetail!.Zy)
        SyLabel.text = String(selectedResultDetail!.Sy)
        ryLabel.text = String(selectedResultDetail!.ry)
        IzLabel.text = String(selectedResultDetail!.Iz)
        SzLabel.text = String(selectedResultDetail!.Sz)
        rzLabel.text = String(selectedResultDetail!.rz)
        JLabel.text = String(selectedResultDetail!.J)
    }
}
