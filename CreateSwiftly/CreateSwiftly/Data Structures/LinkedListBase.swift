//
//  LinkedListBase.swift
//  Leet
//
//  Created by Larissa Perara on 3/22/20.
//  Copyright © 2020 Larissa Perara. All rights reserved.
//

import Foundation

/* List Node class used by leet code in compling */
public class ListNode {
   public var val: Int
   public var next: ListNode?
   public init(_ val: Int) {
       self.val = val
       self.next = nil
    }
   
   // Personal helper for debugging
   public func printList() -> Void {
       var pointer: ListNode? = self
       while pointer != nil, let val = pointer?.val {
           print(Int(val))
           pointer = pointer?.next ?? nil
       }
   }
}
// How do we do this better with protocols
//protocol LinkedListBase {
//    func updateGlobalList(_ value: Int)
//    func incrementNode(_ node: ListNode?) -> ListNode?
//    func getNodeValue(_ node: ListNode?) -> Int
//}

public class LinkedListProbelm {
    var head: ListNode?
    var tail: ListNode?
    
    typealias List = (head: ListNode?,tail: ListNode?)
    
    func updateLocalList(_ value: Int,_ list: List) -> List {
        var head = list.head
        var tail = list.tail
        
        let newNode = ListNode(value)
        
        if head == nil {
            head = newNode
        }

        tail?.next = newNode
        tail = newNode
        
        return List(head, tail)
    }
    
    func updateGlobalList(_ value: Int) {
        let newNode = ListNode(value)
        
        if self.head  == nil {
            self.head = newNode
        }

        self.tail?.next = newNode
        self.tail = newNode
    }
    
    func incrementNode(_ node: ListNode?) -> ListNode? {
        guard let listNode = node else {
            return nil
        }

        return listNode.next
    }
    
    func getNodeValue(_ node: ListNode?) -> Int {
        guard let listNode = node else {
            return 0
        }

        return listNode.val
    }
    
    public func createList(_ nums: [Int]) -> ListNode? {
        var head: ListNode?
        var tail: ListNode?

        for num in nums {
            let update = updateLocalList(num, List(head, tail))
            head = update.head
            tail = update.tail
        }
        
        return head
    }
}

