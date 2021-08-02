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

extension ArrayFunction {
  // MARK: Map (Array)
  // Reduces bolierplate code i.e. creating "holder functions" while doing comptation
  // *ANY* collection i.e. dictionary, sets, etc.
  
  func maps() {
    let values = [1, 4, 5, 6, 7]
    
    // Standard Map: iterates through *any* collection & applies the same operation to each element
    let double = values.map{ $0 * 2 }
    
    // Flat Map
    let map = values.fla
    // Compact Map
    
  }
  
  func filter() {
    // Loop over collection & return a collection only containing those elements that satisfy the condition i.e. even only
    let values = [1, 4, 5, 6, 7]
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
