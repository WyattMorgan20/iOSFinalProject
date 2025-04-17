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
    
    var Miles = 0.0
    var Kilometers = 0.0
    var Feet = 0.0
    var Inches = 0.0
    var Centimeters = 0.0
    
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
        
        valueSelectedFrom = fromPicker[0]
        valueSelectedTo = toPicker[0]
        
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
        
        if pickerView == convertFromPV {
            valueSelectedFrom = fromPicker[row]
        }
        else if pickerView == convertToPV {
            valueSelectedTo = toPicker[row]
        }
        
    }


    @IBAction func placeHolderBTN(_ sender: UIButton) {
        current = Double(inputOL.text!)!
        
        if valueSelectedFrom == "Miles" {
            Miles = current
            Kilometers = 1.6
            Feet = 5280
            Inches = 63360
            Centimeters = 160934.4
            
            if valueSelectedTo == "Kilometers" {
                converted = Miles * Kilometers
            }
            else if valueSelectedTo == "Feet" {
                converted = Miles * Feet
            }
            else if valueSelectedTo == "Inches" {
                converted = Miles * Inches
            }
            else if valueSelectedTo == "Centimeters" {
                converted = Miles * Centimeters
            }
        }
        else if valueSelectedFrom == "Kilometers" {
            Kilometers = current
            Miles = 0.6
            Feet = 3280.8
            Inches = 40467.2
            Centimeters = 100000
            
            if valueSelectedTo == "Miles" {
                converted = Kilometers * Miles
            }
            else if valueSelectedTo == "Feet" {
                converted = Kilometers * Feet
            }
            else if valueSelectedTo == "Inches" {
                converted = Kilometers * Inches
            }
            else if valueSelectedTo == "Centimeters" {
                converted = Kilometers * Centimeters
            }
        }
        else if valueSelectedFrom == "Feet" {
            Feet = current
            Kilometers = 0.000189394
            Miles = 0.000000568182
            Inches = 12
            Centimeters = 30.48
            
            if valueSelectedTo == "Miles" {
                converted = Feet * Miles
            }
            else if valueSelectedTo == "Kilometers" {
                converted = Feet * Kilometers
            }
            else if valueSelectedTo == "Inches" {
                converted = Feet * Inches
            }
            else if valueSelectedTo == "Centimeters" {
                converted = Feet * Centimeters
            }
        }
        else if valueSelectedFrom == "Inches" {
            Inches = current
            Kilometers = 0.0000254
            Miles = 0.0000000833333
            Feet = 0.0833333
            Centimeters = 2.54
            
            if valueSelectedTo == "Miles" {
                converted = Inches * Miles
            }
            else if valueSelectedTo == "Kilometers" {
                converted = Inches * Kilometers
            }
            else if valueSelectedTo == "Feet" {
                converted = Inches * Feet
            }
            else if valueSelectedTo == "Centimeters" {
                converted = Inches * Centimeters
            }
        }
        else if valueSelectedFrom == "Centimeters" {
            Centimeters = current
            Kilometers = 0.000001
            Miles = 0.000000000621371
            Feet = 0.00328084
            Inches = 0.393701
            
            if valueSelectedTo == "Miles" {
                converted = Centimeters * Miles
            }
            else if valueSelectedTo == "Kilometers" {
                converted = Centimeters * Kilometers
            }
            else if valueSelectedTo == "Feet" {
                converted = Centimeters * Feet
            }
            else if valueSelectedTo == "Inches" {
                converted = Centimeters * Inches
            }
        }
        
//        ✅ Fix:
//        Option 1: Manually trigger the segue after the values are updated
//
//        If your segue is set in storyboard (via button dragging to next view controller), change it to manual and trigger it in code like this:
//
//        Remove the storyboard segue from the button.
//        Assign it an identifier, like "secondVCSegue"
//        Add this to your button action, at the end of placeHolderBTN:
//        self.performSegue(withIdentifier: "secondVCSegue", sender: self)
//        This ensures the segue only happens after current and converted have been updated.
        
        self.performSegue(withIdentifier: "secondVCSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var transition = segue.identifier
        if transition == "secondVCSegue" {
            var destination = segue.destination as! SecondViewController
            
            destination.currentOut = current
            destination.convertedOut = converted
            destination.selectedFrom = valueSelectedFrom
            destination.selectedTo = valueSelectedTo
        }
    }
}

