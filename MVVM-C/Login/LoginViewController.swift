//
//  LoginViewController.swift
//  MVVM-C
//
//  Created by Bhooshan Patil on 31/07/21.
//

import UIKit

class LoginViewController: UIViewController {
  
  var viewModel: LoginViewModel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func didTapLoginButton(_ sender: UIButton) {
    self.viewModel?.onTapLogin()
  }
  
  @IBAction func didTapForgotPasswordButton(_ sender: UIButton) {
    self.viewModel?.onTapForgotPassword()
  }
  
  @IBAction func didTapRegisterButton(_ sender: UIButton) {
    self.viewModel?.onTapCreateAccount()
  }
  
  public func displayAlertMessage(error: NSError) {
    let alertcontroller = UIAlertController(title: "error title", message: " error message", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertcontroller.addAction(okAction)
    self.present(alertcontroller, animated: true, completion: nil)
  }
  
  deinit {
    print(#function , NSStringFromClass(LoginViewController.self))
  }
}
