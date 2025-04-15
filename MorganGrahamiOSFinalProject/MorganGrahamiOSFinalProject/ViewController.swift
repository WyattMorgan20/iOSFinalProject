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
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        
        valueSelectedFrom = fromPicker[pickerView.selectedRow(inComponent: 0)]
        valueSelectedTo = toPicker[pickerView.selectedRow(inComponent: 0)]
        
    }


    @IBAction func placeHolderBTN(_ sender: UIButton) {
        
    }
}

