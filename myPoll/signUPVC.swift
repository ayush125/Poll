//
//  signUPVC.swift
//  myPoll
//
//  Created by iUS on 1/6/17.
//  Copyright © 2017 myPoll. All rights reserved.
//

import UIKit

class signUPVC: UIViewController {

    @IBOutlet weak var loginImageView: UIImageView!
    
    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    

    
    @IBAction func loginAction(_ sender: Any) {
//        if let destVC = UIStoryboard(name:"Home", bundle:nil).instantiateViewController(withIdentifier: "DrawerVC") as? DrawerVC{
//            if let navigator=navigationController{
//                       navigator.pushViewController(destVC, animated: true)
//            }
//        }
        let destVC : UIViewController=self.storyboard!.instantiateViewController(withIdentifier: "Home")
        self.present(destVC, animated: true) { 
           print("success")
        }
    }
    
    @IBAction func SignupActn(_ sender: Any) {
    }
    
    @IBAction func SkipAction(_ sender: Any) {
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

