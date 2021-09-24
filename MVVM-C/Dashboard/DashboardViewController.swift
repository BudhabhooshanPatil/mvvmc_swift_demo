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
  }
  
}
