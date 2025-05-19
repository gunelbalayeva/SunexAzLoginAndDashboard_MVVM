//
//  LoginViewController.swift
//  SunexAzLoginAndDashboard_MVVM
//
//  Created by User on 17.05.25.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    private let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Daxil ol"
        bindViewModel()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func bindViewModel() {
        viewModel.onSuccess = { [weak self] user, token in
            DispatchQueue.main.async {
                guard let vc = self?.storyboard?.instantiateViewController(withIdentifier: DashboardViewController.identifier) as? DashboardViewController else {
                    return
                }
                //                vc.user = user
                //                vc.token = token
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
        viewModel.onFailure = { [weak self] errorMsg in
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Xəta", message: errorMsg, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self?.present(alert, animated: true)
            }
        }
    }
    
    
    @IBAction private func loginButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "Email və şifrə boş ola bilməz")
            return
        }
        
        guard email.contains("@"), email.contains(".") else {
            showAlert(message: "Email düzgün formatda deyil")
            return
        }
        
        viewModel.login(email: email, password: password)
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Xəta", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
