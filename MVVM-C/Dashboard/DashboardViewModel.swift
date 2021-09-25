//
//  DashboardViewModel.swift
//  MVVM-C
//
//  Created by Bhooshan Patil on 24/09/21.
//

import Foundation

public protocol DashboardViewModeCoordinatorlDelegate: AnyObject {
  func logout()
}

public class DashboardViewModel: NSObject {
  public let appuser: User
  public weak var coordinatorDelegate: DashboardViewModeCoordinatorlDelegate?
  public init(appUser: User) {
    self.appuser = appUser
  }
  public func deleteDataAndLogout() -> Void {
    self.coordinatorDelegate?.logout()
  }
}
