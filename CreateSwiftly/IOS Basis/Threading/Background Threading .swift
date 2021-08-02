//
//  Background Threading .swift
//  Leet
//
//  Created by Larissa Perara on 3/29/21.
//  Copyright © 2021 Larissa Perara. All rights reserved.
//

import Foundation

// MARK: - Foundational Notes & Nomeclature

// There are four different groups of activities we use for threading, these are detailed
// by inidicating the QoS (Quality of Service) based on:
//
// (1) how quickly it needs to be procceed (priority)
// and/or
// (2) the expected throughput:

// - .userInteractive: work that must be processed instantly
// - .userInitiated: work that almost instananeous (< a few seconds)
// - .utility: work that can take some, but should return in a reasonable amoutn of time, i.e. API call.
// - .background: work that could/ will take a long time

func heavyMainThreadTask

class BackgroundThreadExample {
    
}

// MARK: - Main thread examples

extension {
    
    // todo add callbacks 
    func heavyTask {
        DispatchQueue.main.async {
            // call intensive task here
        }
    }
}
