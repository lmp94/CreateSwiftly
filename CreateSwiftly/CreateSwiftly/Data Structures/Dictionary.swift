//
//  Dictionary.swift
//  Leet
//
//  Created by Larissa Perara on 3/25/20.
//  Copyright © 2020 Larissa Perara. All rights reserved.
//

import Foundation

final class DicionaryFunctions {
    
    var namesOfIntegers = [Int: String]() // empty
    
    var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    var airports2 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    
    func basic() {
        
        // Basic Adding
        namesOfIntegers[16] = "sixteen"
        namesOfIntegers = [:]
        
        // Empty check
        if airports.isEmpty {
            print("The airports dictionary is empty.")
        } else {
            print("The airports dictionary is not empty.")
        }
        
        // Updating and Adding
        
        airports["LHR"] = "London"
        
        if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
            print("The old value for DUB was \(oldValue).")
        }
        
        // Finding
        
        if let airportName = airports["DUB"] {
            print("The name of the airport is \(airportName).")
        } else {
            print("That airport is not in the airports dictionary.")
        }
        
        // Removing
        
        airports["APL"] = "Apple International" // "Apple International" is not the real airport for APL, so delete it
        airports["APL"] = nil // APL has now been removed from the dictionary
        
        if let removedValue = airports.removeValue(forKey: "DUB") {
            print("The removed airport's name is \(removedValue).")
        } else {
            print("The airports dictionary does not contain a value for DUB.")
        }
        
        // Iteration
        for (airportCode, airportName) in airports {
            print("\(airportCode): \(airportName)")
        }
        
        for airportCode in airports.keys {
            print("Airport code: \(airportCode)")
        }
        
        for airportName in airports.values {
            print("Airport name: \(airportName)")
        }
        
        // into Array
        
        let airportCodes = [String](airports.keys)
        // airportCodes is ["LHR", "YYZ"]

        let airportNames = [String](airports.values)
        // airportNames is ["London Heathrow", "Toronto Pearson"
        
        print(airportCodes, airportNames)
    }



}
