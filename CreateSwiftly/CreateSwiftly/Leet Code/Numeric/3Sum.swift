//
//  3Sum.swift
//  Leet
//
//  Created by Larissa Perara on 3/22/20.
//  Copyright © 2020 Larissa Perara. All rights reserved.
//

import Foundation

/* Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

    Note: The solution set must not contain duplicate triplets.

    Example: Given array nums = [-1, 0, 1, 2, -1, -4],

    A solution set is:
    [
      [-1, 0, 1],
      [-1, -1, 2]
    ]
 */

// Normal skip of the duplicates
extension Collection where Element: Equatable {
  
  /// In a sorted collection, replaces the given index with a successor mapping to a unique element.
  ///
  /// - Parameter index: A valid index of the collection. `index` must be less than `endIndex`
  func formUniqueIndex(after index: inout Index) {
    var prev = index
    repeat {
      prev = index
      formIndex(after: &index)
    } while index < endIndex && self[prev] == self[index]
  }
}

// Uninque input `before`
extension BidirectionalCollection where Element: Equatable {
  
  /// In a sorted collection, replaces the given index with a predecessor that maps to a unique element.
  ///
  /// - Parameter index: A valid index of the collection. `index` must be greater than `startIndex`.
  func formUniqueIndex(before index: inout Index) {
    var prev = index
    repeat {
      prev = index
      formIndex(before: &index)
    } while index > startIndex && self[prev] == self[index]
  }
}

func threeSum<T: BidirectionalCollection>(_ collection: T, target: T.Element) -> [[T.Element]] where T.Element: Numeric & Comparable {
  let sorted = collection.sorted()
  var ret: [[T.Element]] = []
  var l = sorted.startIndex
  
  ThreeSum: while l < sorted.endIndex { defer { sorted.formUniqueIndex(after: &l) }
    var m = sorted.index(after: l)
    var r = sorted.index(before: sorted.endIndex)
    
    TwoSum: while m < r && r < sorted.endIndex {
      let sum = sorted[l] + sorted[m] + sorted[r]
      if sum == target {
        ret.append([sorted[l], sorted[m], sorted[r]])
        sorted.formUniqueIndex(after: &m)
        sorted.formUniqueIndex(before: &r)
      } else if sum < target {
        sorted.formUniqueIndex(after: &m)
      } else {
        sorted.formUniqueIndex(before: &r)
      }
    }
  }
  
  return ret
}

final class ThreeSum {
    public static let shared = ThreeSum()
    
    var solution: [[Int]] = []
    var numsDict = [Int: Int] ()
    
    func precompute(_ nums: [Int]) {
        for (index, num) in nums.enumerated() {
            numsDict[num] = index
        }
    }
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard !nums.isEmpty, nums.count >= 4 else {
            if nums.count == 3 && nums[0] + nums[1] + nums[2] == 0 {
                return [nums]
            }
            return []
        }

        let sorted = nums.sorted()
        
        precompute(nums)
        for a in 0..<sorted.count-1 {
            let numA = sorted[a]
            for b in a..<sorted.count where a != b {
                let numB = sorted[b]
                let difference = 0-numA-numB
                if difference > numB, let index = numsDict[difference], index != b, index != a {
                    let newEntry = [numA, numB, difference]

                    if !containsPermutation(array: newEntry) {
                        solution.append(newEntry)
                    }
                }
            }
        }
        return solution
    }
    
    func containsPermutation(array: [Int]) -> Bool {
        for nums in solution {
            if nums.elementsEqual(array) {
                return true
            }
            
            if array[0] == array[1] && array[1] == array[2] {
                continue
            }
            
            var contains = 0
            for a in array where nums.contains(a) {
                contains = contains + 1
            }
            
            if contains == 3 {
                return true
            }
        }
        return false
    }
}
