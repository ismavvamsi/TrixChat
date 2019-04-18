//
//  InitiateChatViewController.swift
//  TrixChat
//
//  Created by Vamsikrishna, Tangudu on 4/14/19.
//  Copyright © 2019 Vamsikrishna, Tangudu. All rights reserved.
//

import UIKit

class InitiateChatViewController: UIViewController {

    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var emailIdTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()

        mobileNumberTextField.setBottomBorder()
        questionTextField.setBottomBorder()
        emailIdTextField.setBottomBorder()
        nameTextField.setBottomBorder()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
