//
//  TwoSum.swift
//  Leet
//
//  Created by Larissa Perara on 3/22/20.
//  Copyright © 2020 Larissa Perara. All rights reserved.
//
import Foundation

/* Given an array of integers, return indices of the two numbers such that they add up to a specific target.
   You may assume that each input would have exactly one solution, and you may not use the same element twice.

   Example:
     Given nums = [2, 7, 11, 15], target = 9,
     Because nums[0] + nums[1] = 2 + 7 = 9,
     return [0, 1].
*/
final class TwoSum {
    
    public static let shared = TwoSum()
    
    // MARK: - Solutions
    
    // Runtime: 32 ms, Memory: 21.4 MB
    func enumeratedSwiftly(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 2 else {
            return [0, 1]
        }
        
        var table = [Int : Int]() //Key: Value from array, Value: Index
        
        for (index, element) in nums.enumerated() {
            if let complimentIndex = table[target - element] {
                return [index, complimentIndex]
            }
            
            table[element] = index
        }
        
        return [-1, -1]
    }
    
    // Runtime: 28 ms, Memory: 21 MB
    func hashTable(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 2 else {
            return [0, 1]
        }
        
        var hashTable = [Int : Int]() //Key: Value from array, Value: Index
                
        for i in 0...nums.count - 1 {
            let num = nums[i]
            let compliment = target - num
            if let index_c = hashTable[compliment] {
                return [i, index_c]
            }
            hashTable[num] = i
        }
        
        return [-1, -1]
    }
    
    // Runtime: 404 ms, Memory: 20.9 MB
    func bruteForce(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 2 else {
            return [0, 1]
        }
        
        let nums_count = nums.count - 1
        
        for i in 0...nums_count {
            let num_i = nums[i]
            for j in (i+1)...nums_count {
                if num_i + nums[j] == target {
                    return [i, j]
                }
            }
        }
        
        return [-1, -1]
    }
    
    // Time limit exceeded
    func bruteForceSwiftly(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 2 else {
            return [0, 1]
        }
                          
         for (index, val) in nums.enumerated() {
            print("index1 \(index)")
             for (index2, val2) in nums.dropFirst(index+1).enumerated()
                 where val + val2 == target {
                    print("Index2: \(index2)")
                    return [index, index2+index+1]
             }
         }
             
        return [-1, -1]
    }
}
