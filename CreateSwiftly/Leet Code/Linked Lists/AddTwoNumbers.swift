//
//  AddTwoNumbers.swift
//  Leet
//
//  Created by Larissa Perara on 3/22/20.
//  Copyright © 2020 Larissa Perara. All rights reserved.
//

import Foundation

// TODO: Find a better iterative solution, try recusive, segregate out LinkedList functionality into class 

/* You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
   
   You may assume the two numbers do not contain any leading zero, except the number 0 itself.

   Example:
     Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
     Output: 7 -> 0 -> 8
     Explanation: 342 + 465 = 807.
 */

final class AddTwoNumbers: LinkedListProbelm {
   
    public static let shared = AddTwoNumbers()
    
    // MARK: - Private Variables

    private var carry: Int = 0
    private var sum: Int = 0
        
    // MARK: - Solutions
    
    func recursivly(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        return resursiveHelper(l1, l2, 0)
    }
    
    // Runtime: 44 ms, Memory: 21
    private func resursiveHelper(_ l1: ListNode?, _ l2: ListNode?, _ carry: Int) -> ListNode? {
        // Base casses
        if l1 == nil && l2 == nil {
            return carry == 1 ? ListNode(1) : nil
        }
        // find sum
        let sum = carry + (l1?.val ?? 0) + (l2?.val ?? 0)
        
        let node = ListNode(sum % 10)
        node.next = resursiveHelper(l1?.next, l2?.next, sum / 10)

        return node
    }

    // Runtime: 52 ms, Memory: 20.4 MB
    func iteratively(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var list1 = l1
        var list2 = l2

        while list1 != nil || list2 != nil {
            let add = getNodeValue(list1) + getNodeValue(list2)  + carry
            setSum(add)

            updateGlobalList(sum)

            // increment lists
            list1 = incrementNode(list1)
            list2 = incrementNode(list2)
        }

        if carry == 1 {
            updateGlobalList(1)
        }

        return head
    }
    
    // MARK: - Private Helpers

    private func setSum(_ num: Int) {
        sum = num
        let sumCheck = sum - 10
        if sumCheck >= 0 {
            carry = 1
            sum = sumCheck
        }
        else {
            carry = 0
        }
    }
}
