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
    var current = 0.0
    var converted = 0.0
    
    var miles = 0.0
    var kilometers = 0.0
    var feet = 0.0
    var inches = 0.0
    var centimeters = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if selectedFrom == "miles" {
            miles = current
            kilometers = 1.6
            feet = 5280
            inches = 63360
            centimeters = 160934.4
            
            if selectedTo == "kilometers" {
                converted = miles * kilometers
            }
            else if selectedTo == "feet" {
                converted = miles * feet
            }
            else if selectedTo == "inches" {
                converted = miles * inches
            }
            else if selectedTo == "centimeters" {
                converted = miles * centimeters
            }
        }
        else if selectedFrom == "kilometers" {
            kilometers = current
            miles = 0.6
            feet = 3280.8
            inches = 40467.2
            centimeters = 100000
            
            if selectedTo == "miles" {
                converted = kilometers * miles
            }
            else if selectedTo == "feet" {
                converted = kilometers * feet
            }
            else if selectedTo == "inches" {
                converted = kilometers * inches
            }
            else if selectedTo == "centimeters" {
                converted = kilometers * centimeters
            }
        }
        else if selectedFrom == "feet" {
            feet = current
            kilometers = 0.000189394
            miles = 0.000000568182
            inches = 12
            centimeters = 30.48
            
            if selectedTo == "miles" {
                converted = feet * miles
            }
            else if selectedTo == "kilometers" {
                converted = feet * kilometers
            }
            else if selectedTo == "inches" {
                converted = feet * inches
            }
            else if selectedTo == "centimeters" {
                converted = feet * centimeters
            }
        }
        else if selectedFrom == "inches" {
            inches = current
            kilometers = 0.0000254
            miles = 0.0000000833333
            feet = 0.0833333
            centimeters = 2.54
            
            if selectedTo == "miles" {
                converted = inches * miles
            }
            else if selectedTo == "kilometers" {
                converted = inches * kilometers
            }
            else if selectedTo == "feet" {
                converted = inches * feet
            }
            else if selectedTo == "centimeters" {
                converted = inches * centimeters
            }
        }
        else if selectedFrom == "centimeters" {
            centimeters = current
            kilometers = 0.000001
            miles = 0.000000000621371
            feet = 0.00328084
            inches = 0.393701
            
            if selectedTo == "miles" {
                converted = centimeters * miles
            }
            else if selectedTo == "kilometers" {
                converted = centimeters * kilometers
            }
            else if selectedTo == "feet" {
                converted = centimeters * feet
            }
            else if selectedTo == "inches" {
                converted = centimeters * inches
            }
        }
        
        
        startingMeasurmentDisplayOL.text = startingMeasurmentDisplayOL.text! + String(current)
        convertedMeasurementOutputOL.text = convertedMeasurementOutputOL.text! + String(converted)
        
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
