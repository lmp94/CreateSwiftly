//
//  Dictionary.swift
//  Leet
//
//  Created by Larissa Perara on 3/25/20.
//  Copyright © 2020 Larissa Perara. All rights reserved.
//

import Foundation

final class DicionaryUsages {
  // empty initaliziation
  var namesOfIntegers = [Int: String]()
  
  // You do not have to define the type unless
  var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
  var airports2 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
  
  
  func basics() {
    namesOfIntegers[16] = "sixteen"
    namesOfIntegers = [:]
    
    if airports.isEmpty {
      print("The airports dictionary is empty.")
    } else {
      print("The airports dictionary is not empty.")
    }
    
    print("Number of items in `airports`: \(airports.count)")
    
    // Finding
    
    if let airportName = airports["DUB"] {
      print("The name of the airport is \(airportName).")
    } else {
      print("That airport is not in the airports dictionary.")
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
  
  // MARK: - Adding Items (TODO)
  func addingItems() {
    
  }
  
  
  // MARK: - Updating Items
  // we are not using a swift extension becasue we need to
  // access private class variables
  func updatingItems() {
    if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
      print("The old value for DUB was \(oldValue).")
    }
    
    print(airports)
    // TODO nil check(?)
    airports["DUB"] = "Dublin International Airport"
  }
  
  
  // MARK: - Removing Items
  // TODO: add airports.remove()
  
  func removeItems() {
    // "Apple International" is not the accurate airport for APL, so delete it
    airports["APL"] = "Apple International"
    airports["APL"] = nil // APL has now been removed from the dictionary
    
    if let removedValue = airports.removeValue(forKey: "DUB") {
      print("The removed airport's name is \(removedValue).")
    } else {
      print("The airports dictionary does not contain a value for DUB.")
    }
  }
  
  // MARK:- TODO: compactMapValues, mapValues, merge, sorting, filter
  // MARK:- TODO: Add Basic Operations:
  // keys, count,
  // create a debugDescriptoin
  // iteration through array of keys (start index etc)
  
  
}
