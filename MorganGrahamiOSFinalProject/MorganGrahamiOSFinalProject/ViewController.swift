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
        
        // Converting all values for input to meters
        var inMeters = 0.0
        switch valueSelectedFrom {
        case "Miles":
            inMeters = current * 1609.344
        case "Kilometers":
            inMeters = current * 1000
        case "Feet":
            inMeters = current * 0.3048
        case "Inches":
            inMeters = current * 0.0254
        case "Centimeters":
            inMeters = current * 0.01
        default:
            inMeters = current
        }
            
        // Converting meters to target unit
        switch valueSelectedTo {
        case "Miles":
            converted = inMeters / 1609.344
        case "Kilometers":
            converted = inMeters / 1000
        case "Feet":
            converted = inMeters / 0.3048
        case "Inches":
            converted = inMeters / 0.0254
        case "Centimeters":
            converted = inMeters / 0.01
        default:
            converted = inMeters
        }
        
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

