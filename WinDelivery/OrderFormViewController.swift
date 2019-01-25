//
//  OrderFormViewController.swift
//  WinDelivery
//
//  Created by Isaac Botwe on 20/01/2019.
//  Copyright © 2019 Isaac Annan. All rights reserved.
//

import UIKit

class OrderFormViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let cylinderSizes = ["5kg","10kg","15kg","20kg","25kg"]
    
    let location = ["Accra","Takoradi","Kumasi","Sunyani","Wa","Tamale","Capecoast","Ho","Bolgatanga","Koforidua"]
    
    
    
    @IBOutlet weak var cylinderField: UITextField!
    
    
    @IBOutlet weak var locationField: UITextField!
    
    @IBOutlet weak var cylinderSizePicker: UIPickerView!
    
    @IBOutlet weak var locationPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()

        cylinderSizePicker.isHidden = true
        // Do any additional setup after loading the view.
        cylinderField.delegate = self
        
        cylinderField.inputView = cylinderSizePicker
        
        locationPicker.isHidden = true
        
        locationField.delegate = self
        
        locationField.inputView = locationPicker
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressSelectSize(_ sender: Any) {
        
        cylinderSizePicker.isHidden = false
        
    }
    
    @IBAction func didPressSelectLocation(_ sender: Any) {
        
        locationPicker.isHidden = false
    }
    
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == cylinderSizePicker){
            return cylinderSizes.count
        }
        if(pickerView == locationPicker){
            return location.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if(pickerView == cylinderSizePicker){
            return cylinderSizes[row]
        }
        
        if(pickerView == locationPicker){
            return location[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(pickerView == cylinderSizePicker){
        
        self.cylinderField.text = self.cylinderSizes[row]
            
            self.cylinderSizePicker.isHidden = true
        }
        
        if(pickerView == locationPicker){
            
            self.locationField.text = self.location[row]
            
            self.locationPicker.isHidden = true
        }
        
    }
    
    }

