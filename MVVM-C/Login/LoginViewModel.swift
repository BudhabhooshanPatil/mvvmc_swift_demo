//
//  LoginViewModel.swift
//  MVVM-C
//
//  Created by Bhooshan Patil on 14/08/21.
//

import Foundation

public protocol LoginViewModelCoordinatorDelegate: AnyObject {
  func loginDidSuccess()
  func loginFailed(error: NSError)
  func didTapCreateAccount()
  func didTapForgotPassword()
}

public class LoginViewModel: NSObject {
  
  private let login_success = true
  
  public weak var coordinatorDelegate: LoginViewModelCoordinatorDelegate?
  
  public func onTapLogin() -> Void {
    
    // REST awesome API here
    if login_success {
      self.coordinatorDelegate?.loginDidSuccess()
    } else {
      self.coordinatorDelegate?.loginFailed(error: NSError(domain: "", code: 401, userInfo: nil))
    }
  }
  
  // create new account
  public func onTapCreateAccount() {
    self.coordinatorDelegate?.didTapCreateAccount()
  }
  
  // forgot password
  public func onTapForgotPassword() {
    self.coordinatorDelegate?.didTapForgotPassword()
  }
}
