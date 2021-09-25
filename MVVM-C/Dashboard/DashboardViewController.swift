//
//  DashboardViewController.swift
//  MVVM-C
//
//  Created by Bhooshan Patil on 15/08/21.
//

import UIKit

class DashboardViewController: UIViewController {
  @IBOutlet weak var userLabel: UILabel!
  
  var viewModel: DashboardViewModel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.userLabel.text = self.viewModel?.appuser.name
    self.rightNavigationBar()
  }
  
  private func rightNavigationBar() {
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout",
                                                             style: .plain,
                                                             target: self,
                                                             action: #selector(logoutUser))
  }
  
  @objc func logoutUser() {
    self.viewModel?.deleteDataAndLogout()
  }
  
  deinit {
    print(#function , NSStringFromClass(DashboardViewController.self))
  }
}
