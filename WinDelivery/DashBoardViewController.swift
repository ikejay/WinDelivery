//
//  DashBoardViewController.swift
//  WinDelivery
//
//  Created by Isaac Botwe on 19/01/2019.
//  Copyright © 2019 Isaac Annan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DashBoardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet weak var infoTableView: UITableView!
    
    var actorsArray = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoTableView.estimatedRowHeight = 180
        infoTableView.rowHeight = 153
        infoTableView.separatorColor = UIColor.clear
        infoTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        
        Alamofire.request("https://poba.tech/windelivery/public/api/v1/auth/login", method: .post, parameters: ["phone":"0275799028",
                        "password":"secret",
                        "fcm_device_id":"kgfvluyt"])
        
            .responseJSON{ response in
                
                let myValue = JSON(response.result.value!)
//                print(myValue)
           
                
                
                Alamofire.request("https://poba.tech/windelivery/public/api/v1/orders", method: .get,  headers: ["Authorization": "Bearer \(myValue["data"]["access_token"])"])
                    .responseJSON {response in
                       debugPrint(response.result)
                        
                        let mValue = JSON(response.result.value!)
                       
                        if(myValue["success"].stringValue == "true"){
                            let result = response.result
                            if let dict = result.value as? Dictionary<String,AnyObject>{
                                if let innerDict = dict["data"]{
                                    self.actorsArray = innerDict as! [AnyObject]


                                    self.infoTableView.reloadData()
                                }
                            }
                            
//                            if let myResults = response.result.value {
//                                let dict:Dictionary = myResults as! Dictionary<String,AnyObject>
//
//                                let innerDict:Dictionary = dict["data"] as! Dictionary<String,AnyObject>
//
//                                let anotherDict:Dictionary = innerDict["service"] as! Dictionary<String,AnyObject>
//
////                                let someDict:String = anotherDict["name"] as! String
////
////                               // let nameFloat:Float = Float(someDict)!
////
////                                self.actorsArray = someDict as! [AnyObject]
//
//                                self.actorsArray = anotherDict as! [AnyObject]
//
//
                            
                           // }
                           
                            
                        }
                        
                        else{
                            
                            alertMessager(title: "error", message: "Error while retrieving data")
                        }
                }
                
                
        }
        

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actorsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = infoTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! orderCell
        
        let orderDate = actorsArray[indexPath.row]["created_at"]
        cell.orderLabel.text = orderDate as? String
        return cell
    }
    
    
//    func fillTable(){
//
//       Alamofire.request("https://poba.tech/windelivery/public/api/v1/orders", method: .get, encoding: URLEncoding.default, headers: ["Authorization": "Bearer: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJod"])
//
//
//
//
///*, parameters: ["date":"service"] , method: .get, headers: ["Authorization": "Bearer: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6NjA2MFwvYXBpXC92MVwvYXV0aFwvbG9naW4iLCJpYXQiOjE1NDcyMjMwNzcsImV4cCI6MTU3ODc1OTA3NywibmJmIjoxNTQ3MjIzMDc3LCJqdGkiOiJpY3dCVnRqTWtCWGl6TXloIiwic3ViIjoyLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.eHhuVjNIQh67ZLQCZSH-nPI5lsEG94P82MI_21c5T3k"]))*/
//
//            .responseJSON{ response in
//
//            debugPrint(response)
//
//        }
//
//    }

}
