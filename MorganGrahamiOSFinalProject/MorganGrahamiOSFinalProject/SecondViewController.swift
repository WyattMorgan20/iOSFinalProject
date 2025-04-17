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
     demo pickerview code:
     var fromPicker: [String] = [String]()
     var toPicker: [String] = [String]()
     
     override func viewDidLoad() {
        super.viewDidLoad()
     
        // Connect data:
        self.convertFromPV.delegate = self
        self.convertFromPV.dataSource = self
     
        self.convertToPV.delegate = self
        self.convertToPV.delegate = self
        
        // Input the data into the arrays
        fromPicker = ["Miles", "Kilometers", "Feet", "Inches", "Centimeters"]
        
        toPicker = ["Miles", "Kilometers", "Feet", "Inches", "Centimeters"]
     
     override func didReceiveMemoryWarning() {
         super.didReceiveMemoryWarning()
         // Dispose of any resources that can be recreated.
     }

     // Number of columns of data
     func numberOfComponents(in pickerView: UIPickerView) -&gt; Int {
         return 1
     }
     
     // The number of rows of data
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -&gt; Int {
         return fromPicker.count, toPicker.count
     }
     
     // The data to return fopr the row and component (column) that's being passed in
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -&gt; String? {
         return fromPicker[row], toPicker[row]
     }
     
     // Capture the picker view selection
     func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         // This method is triggered whenever the user makes a change to the picker selection.
         // The parameter named row and component represents what was selected.
     }
 ...
     }
     */

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
