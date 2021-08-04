//
//  Set.swift
//  Leet
//
//  Created by Larissa Perara on 3/25/20.
//  Copyright © 2020 Larissa Perara. All rights reserved.
//

import Foundation

final class SetFunctions {
    var letters = Set<Character>()

    // MARK: - Basic Common Functions

    func functionsAllowed() {
        letters.insert("a")

        // Empty
        letters = []
        
        var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
        
        if favoriteGenres.isEmpty {
            favoriteGenres.insert("Jazz")
        }
        
        //Remove
        
        if let removedGenre = favoriteGenres.remove("Rock") {
            print("\(removedGenre)? I'm over it.")
        } else {
            print("I never much cared for that.")
        }
        
        // contains
        if favoriteGenres.contains("Funk") { // Complexity: O(1)
            print("I get up on the good foot.")
        } else {
            print("It's too funky in here.")
        }
    }
    
    func itereation() {
        let favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

        for genre in favoriteGenres {
            print("\(genre)")
        }
        
        for genre in favoriteGenres.sorted() {
            print("\(genre)")
        }
    }
    
    // MARK: - Set Operations
    
    func operations() {
        let oddDigits: Set = [1, 3, 5, 7, 9]
        let evenDigits: Set = [0, 2, 4, 6, 8]
        let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

        // Note: Everything below returns a new set

        // All of the values in both sets
        let union = oddDigits.union(evenDigits).sorted() // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        // Sorted Complexity: O(*n* log *n*), where *n* is the length of the sequence.
        print (union)
        
        // common to both sets
        let inersection = oddDigits.intersection(evenDigits).sorted() // []
        print(inersection)
        
        // values not in the specified set
        let subtracting = oddDigits.subtracting(singleDigitPrimeNumbers).sorted() // [1, 9]
        print(subtracting)
        
        // what values are not shared between the two sets
        // vales not specified in the set
        let symmetricDifference = oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted() // [1, 2, 9]
        print(symmetricDifference)
    }
    
    // MARK: - Set Membership & Equality
    func membership() {
        let houseAnimals: Set = ["🐶", "🐱"]
        let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
        let cityAnimals: Set = ["🐦", "🐭"]
        
        // == to see if they are exactly the same

        let isSubSet = houseAnimals.isSubset(of: farmAnimals) // true
        let isSuperset = farmAnimals.isSuperset(of: houseAnimals) // true
        
        // two sets have nothing in commong
        let isDisjoint = farmAnimals.isDisjoint(with: cityAnimals) // true
        
        print(isSubSet, isSuperset, isDisjoint)
    }

    
}
