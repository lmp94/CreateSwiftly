//
//  LongestSubString.swift
//  Leet
//
//  Created by Larissa Perara on 3/22/20.
//  Copyright © 2020 Larissa Perara. All rights reserved.
//

import Foundation

/* Given a string, find the length of the longest substring without repeating characters.

   Example 1:
    Input: "abcabcbb"
    Output: 3
    Explanation: The answer is "abc", with the length of 3.
  Example 2:
    Input: "bbbbb"
    Output: 1
    Explanation: The answer is "b", with the length of 1.
 
 Example 3:
    Input: "pwwkew"
    Output: 3
    Explanation: The answer is "wke", with the length of 3.
              Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
*/
final class LongestSubString {

    public static let shared = LongestSubString()
    
    // Runtime: 88 ms, Memory: 21.3 MB
    func withoutRepeatsOptimizeRuntime(_ s: String) -> Int {
        var letters: [Character: Int] = [:] // Chacter Index
        var indicies: [Int: Character] = [:] // Index character
        
        let characterArray = Array(s)
        var index = 0
        var indexS = 0 // Starting pointer
        var longestCount =  characterArray.count > 0 ? 1 : 0
        
        while index < characterArray.count {
            let val = characterArray[index]
            
            if let lastIndex = letters[val] {
                let newStart = lastIndex + 1
                
                // Clear about the set
                for i in indexS...lastIndex {
                    if let charForI = indicies[i] {
                        letters.removeValue(forKey: charForI)
                        indicies.removeValue(forKey: i)
                    }
                }
                // Increment the starter pointer to where the duplicated letter is
                indexS = newStart
            }
            
            // track the letters
            letters[val] = index
            indicies[index] = val
            
            // index through the array
            index = index + 1
            
            print(letters)
    
            // only incremement the count if we have a new record
            longestCount = letters.count > longestCount ? letters.count : longestCount
        }
        return longestCount
    }
    
    // Runtime: 972 ms, Memory: 21.3 MB
    func withoutRepeatsFirstAttempt(_ s: String) -> Int {
        let characterArray = Array(s)

        // letters in the current longest substring
        var letters = Set<Character>()
        var longestCount = characterArray.count > 0 ? 1 : 0
        
        var index = 0
        var indexS = 0 // Starting pointer
        
        while index < characterArray.count {
            let val = characterArray[index]
            
            if letters.contains(val) {
                // Increment the starter pointer
                indexS = indexS + 1
                
                // Start at the beginning agin
                index = indexS
                
                // Clear about the set
                letters.removeAll(keepingCapacity: false)
            }
            else {
                // track the letters
                letters.insert(val)
                
                longestCount = letters.count > longestCount ? letters.count : longestCount
                
                // index through the array
                index = index + 1
            }
        }
        return longestCount
    }
}
