//
//  Array.swift
//  Leet
//
//  Created by Larissa Perara on 3/25/20.
//  Copyright © 2020 Larissa Perara. All rights reserved.
//

import Foundation

final class ArrayFunctions {
    
    // Shortened forms are preferred
    var emptyDoubles: [Double] = []
    var emptyInts = [Int]()
    var threeDoubles: [Double] = [0.0, 0.0, 0.0]
    
    
    
    func appendAndRemoval() {
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
        
        var shoppingList = ["Eggs", "Milk", "Flour", "Baking Powder", "Chocolate Spread", "Cheese", "Butter"]
        shoppingList[4...6] = ["Bananas", "Apples"] // replaces "Chocolate Spread", "Cheese", and "Butter" with "Bananas" and "Apples"
        // shopping list now has 4 items
        shoppingList.insert("Maple Syrup", at: 0)
        
        // Removal
        let apples = shoppingList.removeLast()     //// - Complexity: O(1)
        print(apples)
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
}
