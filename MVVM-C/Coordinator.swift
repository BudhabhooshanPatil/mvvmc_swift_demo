//
//  Coordinator.swift
//  MVVM-C
//
//  Created by Bhooshan Patil on 31/07/21.
//

import Foundation

/**
 Coordinator responsibility is to handle navigation flow: the same way that
 UINavigationController keeps reference of its stack,
 Coordinator do the same with its children.
 */
protocol Coordinator : AnyObject {
  var childCoordinators : [Coordinator] { get set }
  func start()
}
/**
 We can store new coordinators to our stack and remove those one when the flow has been completed
 (i.e.: user navigated back, view has been dismissed, etc).
 */
extension Coordinator {
  
  func store(coordinator: Coordinator) {
    childCoordinators.append(coordinator)
  }
  
  func free(coordinator: Coordinator) {
    childCoordinators = childCoordinators.filter { $0 !== coordinator }
  }
}
