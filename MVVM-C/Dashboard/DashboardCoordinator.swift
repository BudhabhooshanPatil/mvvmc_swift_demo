//
//  DashboardCoordinator.swift
//  MVVM-C
//
//  Created by Bhooshan Patil on 31/07/21.
//

import UIKit

protocol DashboardCoordinatorDelegate: AnyObject {
  func didFinishDashboardCordinator(coordinator: Coordinator)
}

class DashboardCoordinator: BaseCoordinator {
  
  private let navigationcontroller: UINavigationController
  public weak var delegate: DashboardCoordinatorDelegate?
  private let user: User
  
  init(navigationcontroller:UINavigationController, with user: User) {
    self.navigationcontroller = navigationcontroller
    self.user = user
  }
  
  override func start() {
    if let controller = self.dashboardController {
      self.navigationcontroller.setViewControllers([controller], animated: false)
    }
  }
  
  // init dashboard-controller with viewmodel dependency injection
  lazy var dashboardController: DashboardViewController? = {
    let controller = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "DashboardViewController") as? DashboardViewController
    let viewModel = DashboardViewModel(appUser: self.user)
    controller?.viewModel = viewModel
    controller?.viewModel?.coordinatorDelegate = self
    return controller
  }()
}

extension DashboardCoordinator: DashboardViewModelDelegate {
  func logout() {
    // logout
    // show login
    // todo
  }
}
