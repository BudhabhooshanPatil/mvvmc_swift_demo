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

class DashboardCoordinator: Coordinator {
  
  var navigationcontroller: UINavigationController?
  weak var delegate: DashboardCoordinatorDelegate?
  
  lazy var dashboardController: DashboardViewController? = {
    let controller = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "DashboardViewController") as? DashboardViewController
    return controller
  }()
  
  init(navigationcontroller:UINavigationController) {
    self.navigationcontroller = navigationcontroller
  }
  
  var childCoordinators: [Coordinator] = []
  
  func start() {
    
    if let navigationController = self.navigationcontroller, let controller = self.dashboardController{
      navigationController.setViewControllers([controller], animated: false)
    }
  }
}
