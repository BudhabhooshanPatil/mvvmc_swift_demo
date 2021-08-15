//
//  AppCoordinator.swift
//  MVVM-C
//
//  Created by Bhooshan Patil on 31/07/21.
//

import Foundation
import UIKit

/**
 Your app should consist of multiple coordinators, one for each scene.
 But it should always have one “main” AppCoordinator, which will be owned by the App Delegate.
 The following code is an example of a basic AppCoordinator.
 All other coordinators in the application will be children of this coordinator.
 */

class AppCoordinator: Coordinator {
  
  let LOGIN_STATUS = true
  
  // MARK: - Properties
  let window: UIWindow?
  
  lazy var rootViewController: UINavigationController = {
    return UINavigationController()
  }()
  
  var childCoordinators: [Coordinator] = []
  
  //  the AppCoordinator it must own the window.
  init(window: UIWindow?) {
    self.window = window
  }
  
  func start() {
    guard let window = window else { return }
    window.rootViewController = rootViewController
    window.makeKeyAndVisible()
    
    if LOGIN_STATUS {
      // login coordinator
      loginFlow()
    } else {
      // list coordinator
      dashboardFlow()
    }
  }
  
  private func loginFlow() {
    let loginCoordinator = LoginCoordinator(navigationcontroller: self.rootViewController)
    loginCoordinator.delegate = self
    store(coordinator: loginCoordinator)
    loginCoordinator.start()
  }
  
  private func dashboardFlow() {
    let dashboardCoordinator = DashboardCoordinator(navigationcontroller: self.rootViewController)
    dashboardCoordinator.delegate = self
    store(coordinator: dashboardCoordinator)
    dashboardCoordinator.start()
  }
  
}

extension AppCoordinator: LoginCoordinatorDelegate {
  func didFinishLoginCordinator(coordinator: Coordinator) {
    self.free(coordinator: coordinator)
    self.dashboardFlow()
  }
}
extension AppCoordinator: DashboardCoordinatorDelegate {
  func didFinishDashboardCordinator(coordinator: Coordinator) {
    self.free(coordinator: coordinator)
  }
}
