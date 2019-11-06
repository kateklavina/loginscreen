//
//  ViewController.swift
//  loginscreen
//
//  Created by Kate on 05/11/2019.
//  Copyright © 2019 Kate Klavina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var userNameTextfield: UITextField!
    @IBOutlet weak var paswordTextField: UITextField!
    
    private let userName = "am"
    private let pasword = "am"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           // Get the new view controller using segue.destination.
        guard segue.identifier == "login" else {return}
        let welcomeVC = segue.destination as! SecondViewController
        
           // Pass the selected object to the new view controller.
        welcomeVC.userName = userNameTextfield.text
        view.endEditing(true)
       }

    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        
    }
    
    
    @IBAction func loginTapped() {
        guard userNameTextfield.text == userName, paswordTextField.text == pasword
            else {warningPopup(withTitle: "Invalid login or pasvord", withMessage: "Please enter correct login/password")
                return
        }
        performSegue(withIdentifier: "login", sender: nil)
        
        
        
    }
    
    
    
   
   
    @IBAction func forgotPawordTapped() {
        warningPopup(withTitle: "OOPS", withMessage: "your name is: \(pasword)")
    }
    
   
    
    @IBAction func forgotUsernameTapped() {
        warningPopup(withTitle: "OOPS", withMessage: "your name is: \(userName)")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
}//end VC
extension UIViewController {
 func warningPopup (withTitle title: String?, withMessage message: String?){
     DispatchQueue.main.async {
        
         let popUP = UIAlertController(title: title, message: message, preferredStyle: .alert)
         let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
         popUP.addAction(okButton)
         self.present(popUP, animated: true, completion: nil)
     }
}
}
// MARK: Text Field Delegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextfield {
            textField.resignFirstResponder()
            paswordTextField.becomeFirstResponder()
        } else {
            loginTapped()
        }
        return true
    }
}
