//
//  ViewController.swift
//  MorganGrahamiOSFinalProject
//
//  Created by Wyatt Morgan on 4/2/25.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == convertToPV{
            return fromPicker.count
        }
        else if pickerView == convertFromPV{
            return toPicker.count
        }
        return 0
    }
    

    @IBOutlet weak var inputOL: UITextField!
    @IBOutlet weak var convertFromPV: UIPickerView!
    @IBOutlet weak var convertToPV: UIPickerView!
    
    var fromPicker: [String] = [String]()
    var toPicker: [String] = [String]()
    var valueSelectedFrom = ""
    var valueSelectedTo = ""
    var current = 0.0
    var converted = 0.0
    
    var miles = 0.0
    var kilometers = 0.0
    var feet = 0.0
    var inches = 0.0
    var centimeters = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.convertToPV.delegate = self
        self.convertToPV.dataSource = self
        
        self.convertFromPV.delegate = self
        self.convertFromPV.dataSource = self
        
        // Input the data into the arrays
        fromPicker = ["Miles", "Kilometers", "Feet", "Inches", "Centimeters"]
        
        toPicker = ["Miles", "Kilometers", "Feet", "Inches", "Centimeters"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == convertToPV {
            return toPicker[row]
        }
        else if pickerView == convertFromPV {
            return fromPicker[row]
        }
        return ""
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        
        valueSelectedFrom = fromPicker[pickerView.selectedRow(inComponent: 0)]
        valueSelectedTo = toPicker[pickerView.selectedRow(inComponent: 0)]
        
    }


    @IBAction func placeHolderBTN(_ sender: UIButton) {
        current = Double(inputOL.text!)!
        
        if valueSelectedFrom == "miles" {
            miles = current
            kilometers = 1.6
            feet = 5280
            inches = 63360
            centimeters = 160934.4
            
            if valueSelectedTo == "kilometers" {
                converted = miles * kilometers
            }
            else if valueSelectedTo == "feet" {
                converted = miles * feet
            }
            else if valueSelectedTo == "inches" {
                converted = miles * inches
            }
            else if valueSelectedTo == "centimeters" {
                converted = miles * centimeters
            }
        }
        else if valueSelectedFrom == "kilometers" {
            kilometers = current
            miles = 0.6
            feet = 3280.8
            inches = 40467.2
            centimeters = 100000
            
            if valueSelectedTo == "miles" {
                converted = kilometers * miles
            }
            else if valueSelectedTo == "feet" {
                converted = kilometers * feet
            }
            else if valueSelectedTo == "inches" {
                converted = kilometers * inches
            }
            else if valueSelectedTo == "centimeters" {
                converted = kilometers * centimeters
            }
        }
        else if valueSelectedFrom == "feet" {
            feet = current
            kilometers = 0.000189394
            miles = 0.000000568182
            inches = 12
            centimeters = 30.48
            
            if valueSelectedTo == "miles" {
                converted = feet * miles
            }
            else if valueSelectedTo == "kilometers" {
                converted = feet * kilometers
            }
            else if valueSelectedTo == "inches" {
                converted = feet * inches
            }
            else if valueSelectedTo == "centimeters" {
                converted = feet * centimeters
            }
        }
        else if valueSelectedFrom == "inches" {
            inches = current
            kilometers = 0.0000254
            miles = 0.0000000833333
            feet = 0.0833333
            centimeters = 2.54
            
            if valueSelectedTo == "miles" {
                converted = inches * miles
            }
            else if valueSelectedTo == "kilometers" {
                converted = inches * kilometers
            }
            else if valueSelectedTo == "feet" {
                converted = inches * feet
            }
            else if valueSelectedTo == "centimeters" {
                converted = inches * centimeters
            }
        }
        else if valueSelectedFrom == "centimeters" {
            centimeters = current
            kilometers = 0.000001
            miles = 0.000000000621371
            feet = 0.00328084
            inches = 0.393701
            
            if valueSelectedTo == "miles" {
                converted = centimeters * miles
            }
            else if valueSelectedTo == "kilometers" {
                converted = centimeters * kilometers
            }
            else if valueSelectedTo == "feet" {
                converted = centimeters * feet
            }
            else if valueSelectedTo == "inches" {
                converted = centimeters * inches
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var transition = segue.identifier
        if transition == "secondVCSegue" {
            var destination = segue.destination as! SecondViewController
            
            destination.current = Double(inputOL.text!)!
            destination.selectedFrom = valueSelectedFrom
            destination.selectedTo = valueSelectedTo
        }
    }
}

