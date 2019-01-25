//
//  RegisterViewController.swift
//  WinDelivery
//
//  Created by Isaac Botwe on 22/01/2019.
//  Copyright © 2019 Isaac Annan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RegisterViewController: UIViewController {

    @IBOutlet weak var nametxtField: UITextField!
    
    @IBOutlet weak var phoneNumField: UITextField!
    
    @IBOutlet weak var passField: UITextField!
    
    
    @IBOutlet weak var passConfirmField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPressRegisterButton(_ sender: Any) {
        
        let name = nametxtField.text
        let phone = phoneNumField.text
        let password = passField.text
        
        Alamofire.request("https://poba.tech/windelivery/public/api/v1/auth/register", method: .post, parameters: ["name": name ?? String(), "phone":phone ?? String(), "password":password ?? String(), "fcm_device_id":"54678940497"])
        
        .responseJSON { response in
            
            debugPrint(response)
            var value = JSON(response.result.value ?? "")
            
            if value["success"].stringValue == "true" {
                
                let alert = UIAlertController(title: "Alert", message: "Registration was successful", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
                //alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
                
                self.present(alert, animated: true)
                
//                alertMessager(message: "Registration Was Successful", action: "Information", option: "OK")
                
                //print("")
            }
            
            else {
                
                let alert = UIAlertController(title: "Error", message: "Registration Was Not Successful", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                //alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
                
                self.present(alert, animated: true)
//                print("Registration not succesful.\(value["error"]["message"])")
            }
            
           
            
        }
        
        
    }
    

}
