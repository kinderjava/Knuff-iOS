//
//  SuccessViewController.swift
//  Knuff
//
//  Created by Simon Blommegard on 30/03/15.
//  Copyright (c) 2015 Bowtie. All rights reserved.
//

import UIKit
import Snap

class SuccessViewController: UIViewController {

  var successView: SuccessView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    successView = SuccessView(frame: CGRectZero)
    
    view.addSubview(successView!)
    
    view.setNeedsUpdateConstraints()
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    successView?.pulseView.pulseView.startAnimations()
  }

  override func updateViewConstraints() {
    super.updateViewConstraints()
    
    successView?.snp_remakeConstraints({ make in
      make.center.equalTo(self.view)
      return
    })
  }
}