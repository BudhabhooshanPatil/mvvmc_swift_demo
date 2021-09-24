//
//  LoginCoordinator.swift
//  MVVM-C
//
//  Created by Bhooshan Patil on 31/07/21.
//

import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
  func didFinishLoginCordinator(coordinator: Coordinator, with user:User)
}

// handles the responsibility if LoginViewController
final class LoginCoordinator: BaseCoordinator {
  
  var navigationcontroller: UINavigationController?
  weak var delegate: LoginCoordinatorDelegate?
  
  init(navigationcontroller:UINavigationController) {
    self.navigationcontroller = navigationcontroller
  }
  
  override func start() {
    
    if let navigationController = self.navigationcontroller, let controller = self.loginController {
      navigationController.setViewControllers([controller], animated: false)
    }
  }
  
  // init login-controller
  lazy var loginController: LoginViewController? = {
    let viewModel = LoginViewModel()
    viewModel.coordinatorDelegate = self
    
    let controller = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
    controller?.viewModel = viewModel
    return controller
  }()
  
  lazy var resetPasswordController: ResetPasswordViewController? = {
    let controller = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "ResetPasswordViewController") as? ResetPasswordViewController
    return controller
  }()
  
  lazy var registerController: RegisterViewController? = {
    let controller = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
    return controller
  }()
  
}

extension LoginCoordinator: LoginViewModelCoordinatorDelegate {
  
  func loginDidSuccess(with user: User) {
    self.delegate?.didFinishLoginCordinator(coordinator: self, with: user)
  }
  
  func loginFailed(error: NSError) {
    self.loginController?.displayAlertMessage(error: error)
  }
  
  func didTapCreateAccount() {
    
    if let navigationController = self.navigationcontroller, let controller = self.registerController {
      navigationController.pushViewController(controller, animated: true)
    }
  }
  
  func didTapForgotPassword() {
    if let navigationController = self.navigationcontroller, let controller = self.resetPasswordController {
      navigationController.pushViewController(controller, animated: true)
    }
  }
}
