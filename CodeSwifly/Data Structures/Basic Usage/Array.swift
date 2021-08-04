//
//  Array.swift
//  Leet
//
//  Created by Larissa Perara on 3/25/20.
//  Copyright © 2020 Larissa Perara. All rights reserved.
//

import Foundation

class ArrayFunctions {
    
    // MARK:- Private Class Scoped Values
    
    // Shortened forms are preferred
    private var emptyDoubles: [Double] = []
    private var emptyInts = [Int]()
    private var threeDoubles: [Double] = [0.0, 0.0, 0.0]
    
}

// MARK: - Array Manipulation (Filter, Map, Reduce)

/// A sequence containing the same elements as this sequence,
/// but on which some operations, such as `map` and `filter`, are
/// implemented lazily.

extension ArrayFunctions {
  // MARK: Map (Array)
  // Reduces bolierplate code i.e. creating "holder functions" while doing comptation
  // *ANY* collection i.e. dictionary, sets, etc.
  
  func mapExample() {
    let values = [1, 4, 5, 6, 7]
    
    // Standard Map: iterates through *any* collection & applies the same operation to each element
    let double = values.map{ $0 * 2 }
    print (double)
    // Flat Map
    // Compact Map
    
    let a = values.compactMap { Int in
      <#code#>
    }
    
  }

  // Note: flatmap is deparriciated
  func mapExamples() {
    // non-optional values to transform
    let values = ["1", "2", "cat", "dog"]
    let mapping: [Int?] = values.map { str in Int(str) }
    // [1, 2, nil, nil]
    
    /// Complexity: O(*m* + *n*), where *n* is the length of this sequence
    ///   and *m* is the length of the result.
    let compact: [Int] = values.compactMap { str in Int(str) }
    // [1, 2] creates an arrya without any nil items
    
    print("Values: \(values), Map: \(mapping), Compact Map: \(compact)")
  }
  
  // Loop over collection & return a collection only containing those elements that satisfy the condition i.e. even only
  func filterExample() {
    let values = [1, 4, 5, 6, 7]
    let even = values.filter { $0 % 2 == 0 }
    print(even)
        
    let names = ["Vivien", "Marlon", "Kim", "Karl"]
    let shortNames = names.filter { $0.count < 5 }
    print(shortNames)
  }
  
  
}

// MARK: - Common Functions: append, remove, iterate

extension ArrayFunctions {
    
    func append() {
        let threeDoubles = Array(repeating: 0.0, count: 3)
        
        // Insertions
        // Because arrays increase their allocated capacity using an exponential
         /// strategy,
         /// (1) Appending a single element to an array is an O(1) operation
         /// when averaged over many calls to the method.
         ///
         /// When an array has additional capacity and is not sharing its storage with another
         /// instance, appending an element is O(1).
         ///
         /// When an array needs to reallocate storage before appending or its storage is shared with
         /// another copy, appending is O(*n*)
        emptyInts.append(1)
        
        var sixDoubles = threeDoubles + emptyDoubles
        var strings = ["apple"]
        
        if strings.isEmpty {
            strings += ["pear"]
            sixDoubles += [5.0]
        }
        
        let item = strings[1]
        print(item)
        
        shoppingList.insert("Maple Syrup", at: 0)
    }
    
    func removal() {
        var toys = ["Ball", "Bat" ]
        
        /// Complexity: O(1)
        let lastValue = shoppingList.removeLast()
        print(lastValue) // Bat
    }
    
    func manipulaation(_ array: Array) {
        var shoppingList = ["Eggs", "Milk", "Flour",
                            "Baking Powder", "Chocolate Spread", "Cheese",
                            "Butter"]
        
        shoppingList[4...6] = ["Bananas", "Apples"]
        /* replaces "Chocolate Spread",
                    "Cheese", and
                    "Butter"
         with "Bananas" and "Apples"
        shopping list now has 4 items */
    }
    
    func iteration() {
        let shoppingList = ["Eggs", "Milk", "Flour", "Baking Powder", "Chocolate Spread", "Cheese", "Butter"]
        
        for item in shoppingList {
            print(item)
        }

        
        for (index, value) in shoppingList.enumerated() { // Enumerated Complexity: O(1)
            print("Item \(index + 1): \(value)")
        }
    }
    
    func transformation() {
        let startingList = ["Eggs", "Milk", "Flour", "Baking Powder", "Chocolate Spread", "Cheese", "Butter"]
    }
}
