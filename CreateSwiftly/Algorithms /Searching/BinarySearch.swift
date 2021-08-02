//
//  BST.swift
//  Leet
//
//  Created by Larissa Perara on 3/24/20.
//  Copyright © 2020 Larissa Perara. All rights reserved.
//

import Foundation

final class BinarySearch {

    public static let shared = BinarySearch()

    // Classic binary search where it just is saying whether it exits or not
    // Finds an items in a sorted array in O(log(n))
    func doesTargetExist(for target: Int, in nums: [Int]) -> Bool {
       var left = -1
       var right = nums.count

        while left + 1 < right {
            let middle = (right - left) / 2
            let val = nums[middle]
        
            guard val != target else {
                return true
            }
            
            left = val < target ? middle : left
            right = val > target ? middle : right
        }
        return false
    }
}
