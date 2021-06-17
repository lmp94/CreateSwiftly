//
//  ViewLIfecycle.swift
//  Leet
//
//  Created by Larissa Perara on 5/23/21.
//  Copyright © 2021 Larissa Perara. All rights reserved.
//

import Foundation
import UIKit

/**
    View Lifecycle
 */

class ViewController: UIViewController {
    
    // MARK:- Beginning of Life Cycle
    override func viewDidLoad() {
        // Called when the view is loaded into memory
        // Only called *** once ***
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Called everytime the view appears
        // Keeps getting called everytime the view appears (animation, etc)
        super.viewWillAppear(animated)
    }
    
    // MARK: Subview Layout
    //       manages the constraints, sizing, and subviews
    
    override func viewWillLayoutSubviews() {
        
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // View is fully loaded
        super.viewDidAppear(animated)
    }
    
    // MARK:- End of LifeCycle
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}
