//
//  LoginViewController.swift
//  WinDelivery
//
//  Created by Isaac Botwe on 19/01/2019.
//  Copyright © 2019 Isaac Annan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class LoginViewController: UIViewController {

    
    @IBOutlet weak var phoneNumField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressSignInButton(_ sender: Any) {
        
        let myNumber = phoneNumField.text!
        let myPassword = passwordField.text!
        
        Alamofire.request("https://poba.tech/windelivery/public/api/v1/auth/login",
                          method: .post,
                          parameters: ["phone": myNumber, "password": myPassword,
                                       "fcm_device_id":"5467285905"])
            .responseJSON { response in
                // 2
                var value = JSON(response.result.value!)
                
                
                if value["success"].stringValue == "true"{
//
                 //   let alert = UIAlertController(title: "Error", message: "Your Name Is: \(value["data"]["user"]["name"].stringValue)", preferredStyle: .alert)
                    
                  //  alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    //alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
                    
                   // self.present(alert, animated: true)
//                    alertMessager(title: "Alert", message: "Your Name Is: \(value["data"]["user"]["name"])")
//                     alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//                    //alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
//
//                    self.present(alert, animated: true)
                    
                    print("Your Name Is: \(value["data"]["user"]["name"])")
                    
                
                    
                    navigateToPage(from: self, storyboardName: "Main", id: "mainTabBarControllerID")
                    
                }
                
                else{
                    let alert = UIAlertController(title: "Error", message: "\(value["error"]["message"])", preferredStyle: .alert)

                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    //alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
                    
                    self.present(alert, animated: true)
                    
                    alertMessager(title: "Error", message: "\(value["error"]["message"])")
                    print("\(value["error"]["message"])")
                }
        
    }
        
        
    
    

}
}
