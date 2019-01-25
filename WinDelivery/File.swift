//
//  File.swift
//  WinDelivery
//
//  Created by Isaac Botwe on 19/01/2019.
//  Copyright © 2019 Isaac Annan. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat{
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            }
            else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
        
    }
    
    }


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

func alertMessager(title: String, message: String){
    
    let alerter = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    alerter.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (action) in
        alerter.dismiss(animated: true, completion: nil)
    }))
   
}




func navigateToPage(from:UIViewController,storyboardName:String,id:String) {
    
    let storyboard:UIStoryboard = UIStoryboard.init(name: storyboardName, bundle: nil)
    
    let mainTabBarController:UIViewController = storyboard.instantiateViewController(withIdentifier: id)
    from.present(mainTabBarController, animated: true, completion: nil)
}

    
