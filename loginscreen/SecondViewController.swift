//
//  SecondViewController.swift
//  loginscreen
//
//  Created by Dace Laizane on 05/11/2019.
//  Copyright © 2019 Kate Klavina. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    var userName : String!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(userName ?? "Noname")! "
        // Do any additional setup after loading the view.
    }


}
