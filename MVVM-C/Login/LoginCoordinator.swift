//
//  LoginCoordinator.swift
//  MVVM-C
//
//  Created by Bhooshan Patil on 31/07/21.
//

import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
  func didFinishLoginCordinator(coordinator: Coordinator)
}

class LoginCoordinator: Coordinator {
  
  var navigationcontroller: UINavigationController?
  weak var delegate: LoginCoordinatorDelegate?
  
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
  
  init(navigationcontroller:UINavigationController) {
    self.navigationcontroller = navigationcontroller
  }
  
  var childCoordinators: [Coordinator] = []
  
  func start() {
    
    if let navigationController = self.navigationcontroller, let controller = self.loginController {
      navigationController.setViewControllers([controller], animated: false)
    }
  }
}

extension LoginCoordinator: LoginViewModelCoordinatorDelegate {
 
  func loginDidSuccess() {
    self.delegate?.didFinishLoginCordinator(coordinator: self)
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
