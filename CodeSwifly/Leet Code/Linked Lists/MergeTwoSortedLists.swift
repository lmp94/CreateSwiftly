//
//  MergeTwoSortedLists.swift
//  Leet
//
//  Created by Larissa Perara on 3/24/20.
//  Copyright © 2020 Larissa Perara. All rights reserved.
//

import Foundation

/* Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

   Example:
    Input: 1->2->4, 1->3->4
    Output: 1->1->2->3->4->4
 **/

final class MergeTwoSortedLists: LinkedListProbelm {
    
    public static let shared = MergeTwoSortedLists()
    
    // Runetime: 12 ms, Memory: 20.8
    func recursivly(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let node1 = l1 else {
            return l2
        }
        
        guard let node2 = l2 else {
            return l1
        }
        
        if node1.val < node2.val {
            node1.next = recursivly(node1.next, node2)
            return node1
        }
        else {
            node2.next = recursivly(node1, node2.next)
            return node2
        }
    }
    
    // Runtime: 16 ms, Memory: 20.9 MB
    func iterativly(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var node1 = l1
        var node2 = l2
        
        while let n1 = node1, let n2 = node2 {
            var newVal = n1.val
            
            if n1.val > n2.val {
                newVal = n2.val
                node2 = n2.next
            }
            else {
                node1 = n1.next
            }
            
            updateGlobalList(newVal)
        }
        
        if let append = returnNonNil(node1, node2) {
            updateGlobalList(append.val)
        }
        
        return head
    }
    
    func returnNonNil(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        return l1 == nil ? (l2 == nil ? nil : l2) : l1
    }
}
