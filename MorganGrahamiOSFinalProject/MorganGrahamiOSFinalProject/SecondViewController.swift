//
//  SecondViewController.swift
//  MorganGrahamiOSFinalProject
//
//  Created by Wyatt Morgan on 4/2/25.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var startingMeasurmentDisplayOL: UILabel!
    
    @IBOutlet weak var convertedMeasurementOutputOL: UILabel!
    
    var selectedFrom = ""
    var selectedTo = ""
    var currentOut = 0.0
    var convertedOut = 0.0
    
    var miles = 0.0
    var kilometers = 0.0
    var feet = 0.0
    var inches = 0.0
    var centimeters = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startingMeasurmentDisplayOL.text = startingMeasurmentDisplayOL.text! + String(currentOut) + " " + selectedFrom
        
        convertedMeasurementOutputOL.text = convertedMeasurementOutputOL.text! + String(convertedOut) + " " + selectedTo
        
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
