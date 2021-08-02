//
//  FirstUnqiueCharacter.swift
//  Leet
//
//  Created by Larissa Perara on 3/22/20.
//  Copyright © 2020 Larissa Perara. All rights reserved.
//

import Foundation

/* Given a string, find the first non-repeating character in it and return it's index. If it doesn't exist, return -1.

   Examples:
    s = "leetcode"
    return 0.
    s = "loveleetcode",
    return 2.
    
   Note: You may assume the string contain only lowercase letters.
*/
final class FirstUniqChar {

    public static let shared = FirstUniqChar()
    
    // Runtime: 768 ms, Memory: 22.8 MB
    func noOptimzation(_ s: String) -> Int {
        typealias TupleChar = (index: Int, count: Int)
        
        var characters: [Character: TupleChar] = [:]
        
        for (index, element) in s.enumerated() {
            if var inMap = characters[element]  {
                let newCount = inMap.count + 1
                inMap.count = newCount
                characters.updateValue(inMap, forKey: element)
            }
            else {
                characters[element] = TupleChar(index: index, count: 1)
            }
        }

        let filered = characters.filter{ $0.value.count == 1}
        let sorted = filered.sorted {$0.value.index < $1.value.index}
        return sorted.first?.value.index ?? -1
    }
    
    // Runtime: 240, Memory: 22.7 MB
    func optimizeRunTime1(_ s: String) -> Int {
        // map to store
        var characters: [Character: Int] = [:]
        var noDuplicates: [Character: Int] = [:]

        for (index, element) in s.enumerated() {
            if var _ = characters[element]  {
                noDuplicates.removeValue(forKey: element)
            }
            else {
                characters[element] = index
                noDuplicates[element] = index
            }
        }
        let sorted = noDuplicates.sorted {$0.value < $1.value}
        return sorted.first?.value ?? -1
    }
    
    // Runtime: 232, Memory: 22.5
    func optimizeRunTime2(_ s: String) -> Int {
        var characters = Set<Character>()
        var noDuplicates: [Character: Int] = [:]

        for (index, element) in s.enumerated() {
            if characters.contains(element)  {
                noDuplicates.removeValue(forKey: element)
            }
            else {
                characters.insert(element)
                noDuplicates[element] = index
            }
        }
        
        let sorted = noDuplicates.sorted {$0.value < $1.value}
        return sorted.first?.value ?? -1
    }
}
