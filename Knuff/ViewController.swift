//
//  ViewController.swift
//  Knuff
//
//  Created by Simon Blommegard on 17/03/15.
//  Copyright (c) 2015 Bowtie. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ViewController: UIViewController, MCNearbyServiceAdvertiserDelegate {
  
  var serviceAdvertiser: MCNearbyServiceAdvertiser?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  
  var deviceTokenString: String?
  
  func setDeviceToken(deviceToken: NSData) {
    let tokenChars = UnsafePointer<CChar>(deviceToken.bytes)
    
    var tokenString = ""
    
    for var i = 0; i < deviceToken.length; i++ {
      tokenString += String(format: "%02.2hhx", arguments: [tokenChars[i]])
    }
    
    deviceTokenString = tokenString
    
    advertise()
  }
  
  func advertise() {
    if let tokenString = deviceTokenString {
      let peerID = MCPeerID(displayName: UIDevice.currentDevice().name)
      
      serviceAdvertiser = MCNearbyServiceAdvertiser(
        peer: peerID,
        discoveryInfo: ["token": tokenString, "type": "iOS"],
        serviceType: "apns-pusher"
      )
      
      serviceAdvertiser?.delegate = self

      serviceAdvertiser?.startAdvertisingPeer();
    }
  }

// MARK: - MCNearbyServiceAdvertiserDelegate
  
  func advertiser(advertiser: MCNearbyServiceAdvertiser!, didNotStartAdvertisingPeer error: NSError!) {
    
  }
  
  func advertiser(advertiser: MCNearbyServiceAdvertiser!, didReceiveInvitationFromPeer peerID: MCPeerID!, withContext context: NSData!, invitationHandler: ((Bool, MCSession!) -> Void)!) {
    invitationHandler(false, nil)
  }
  
}
