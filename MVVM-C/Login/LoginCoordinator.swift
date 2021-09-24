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
  
  private let navigationcontroller: UINavigationController
  public weak var delegate: LoginCoordinatorDelegate?
  
  init(navigationcontroller:UINavigationController) {
    self.navigationcontroller = navigationcontroller
  }
  
  override func start() {
    if let controller = self.loginController {
      self.navigationcontroller.setViewControllers([controller], animated: false)
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
}

extension LoginCoordinator: LoginViewModelCoordinatorDelegate {
  
  func loginDidSuccess(with user: User) {
    self.delegate?.didFinishLoginCordinator(coordinator: self, with: user)
  }
  
  func loginFailed(error: NSError) {
    self.loginController?.displayAlertMessage(error: error)
  }
}
