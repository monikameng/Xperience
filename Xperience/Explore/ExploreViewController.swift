//
//  ExploreViewController.swift
//  Xperience
//
//  Created by 孟琦 on 6/8/17.
//  Copyright © 2017 Xperience. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController {
    
    @IBOutlet var mainBodyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var isLoggedIn = false
        if (!isLoggedIn) {
            
            DispatchQueue.main.async() {
                [unowned self] in
                self.performSegue(withIdentifier: "showSignIn", sender: self)
            }
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
