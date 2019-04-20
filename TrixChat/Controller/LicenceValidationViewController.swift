//
//  LicenceValidationViewController.swift
//  TrixChat
//
//  Created by Vamsikrishna, Tangudu on 4/14/19.
//  Copyright © 2019 Vamsikrishna, Tangudu. All rights reserved.
//

import UIKit
import SVProgressHUD

class LicenceValidationViewController: UIViewController {
    
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var licenceKeyTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var trixChatImageView: UIImageView!
    @IBOutlet weak var chatButton: UIButton!
    let checkLicenceResponse = CheckLicenseResponse()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urlTextField.setBottomBorder()
        licenceKeyTextField.setBottomBorder()
        mobileTextField.setBottomBorder()
        emailTextField.setBottomBorder()
        nameTextField.setBottomBorder()
    }
    
    @IBAction func chatAction(_ sender: Any) {
        
        }
}
extension UIViewController {
    
    @objc func hideKeyboardWhenTap() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
