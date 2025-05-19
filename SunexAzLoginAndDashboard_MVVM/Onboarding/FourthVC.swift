//
//  FourthVC.swift
//  SunexAzApp
//
//  Created by User on 10.04.25.
//

import UIKit

class FourthVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: LoginViewController.identifier) as? LoginViewController  else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
}
