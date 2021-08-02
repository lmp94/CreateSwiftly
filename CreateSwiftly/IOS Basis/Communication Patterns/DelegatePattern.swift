//
//  DelegatePattern.swift
//  Leet
//
//  Created by Larissa Perara on 5/23/21.
//  Copyright © 2021 Larissa Perara. All rights reserved.
//

import Foundation
import UIKit

// TODO: Look up new delegation patterns in Swift 5:

/**
    This class is a basic class to show the
    the delegate communication pattern between views in Swift.
 
    Delegation: design pattern that enables a class to hand or
                (or "delegate") some of its responsiblites to
                an instance of another class
 
    Delegates are often construction out of three parts:
      (1) Protocol: this provides felxiblity to create differing
                      delegate implementations w/ the same protocol
                      declaration.
      (2) Protocol Implmenetation: This is the "delegate" implementation itself
                                  This defines what should happen when the function is called
      (3) Delegate Coller
 
    A few advantages using delegates can give you are:
      (1) The abstraction necessary to implement dependcey injections, which often support
            more robust test cases, leaded to a more stable, reliable product implementation.
      (3) Communication in specific, customizable pattern that is one to one communication.
 */



// MARK:- Step 1: Protocol Definiton for the Delegate
/**
 
 
 Delegates provide a few advanges:
      a way to do depencies injections & abstraction to allow for
 q  uality testing
 **/

// A protocl dfines a blueprint of methods, roperties, and other requirements
//    that suit a particular task or piece of functionality
protocol DelegateExample: AnyObject {
  // Using a protocol
  func delegateFunction(_ color: UIColor?)
}

// Often this is not done is the same class becaue the purpose is
//    to asbstract the information out of the class.
// Below are just some basic skeltons, to express the concep that
//   the purpose of making a delgate is often when you want separate,
//   distinict implementations, but accesible and to be chosen by
//   the calling class. 

class DelegateImplementaion: DelegateExample {
  func delegateFunction(_ color: UIColor) {
    log(.info, "Color")
  }
}

class DelegateImplementaion2: DelegateExample {
  func delegateFunction(_ color: UIColor) {
    log(.info, "Color 2")
  }
}

// Property Wrappers (property Delegates) @Injected property wrapped, @propertyWrapper
class DelegateExampleClass: UIViewController {
  
  weak var delegate: DelegateExampele // Consider lazy vairable
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // We use delegates to abstract out unnecessary work /
  //    information the view / view controller
  // It also is a way to customize our
  func handleTap(_ tapGesture: UITapGestureRecognizer) { // Poor signature
    delegate?.delegateFunction(tapGesture.view?.backgroundColor)
  }
}

