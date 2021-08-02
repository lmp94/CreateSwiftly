//
//  HashTable.swift
//  Leet
//
//  Created by Larissa Perara on 6/17/21.
//  Copyright © 2021 Larissa Perara. All rights reserved.
//

import Foundation

// Implementation:

// Better performance, loaded on to the Stack
public struct HashTable<Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
    private typealias Bucket: [Element]
    
    private var buckets: [Bucket]

    // # of K Pairs
    private (set) public var count = 0
    
    // bool if empty
    public var isEmpty: Bool { return count == 0 }

    // Create hash table w/ given capacity
    public init(_ capacity: Int)  {
        assert(capacity > 0) // bc initialize
        buckets = Array<Bucket>(repeatElement([], count: capacity))
    }

    // Access value given a string
    public subscript(key: Key) -> Value? {
        get { return value(forKey: key) }
        set {
            if let value = newValue { updateValue(value, forKey: key) }
            else { removeValue(forKey: key) }
        }
    }
    
// returns value for given key
    public func value(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        for element in buckets[index] {
            if element.key = key {
                return element.value
            }
        }
        return nil // not in hash table
}

    // update value
@discardableResult public mutating func updateValue(_ value: Value, forKey: Key) -> Value? {
    let index = self.index(forKey: key)
    
    // Check if key is already in bucket
    for (I, element) in buckets[index].enumerated() {
        if element.key == key {
            let oldValue = element.value
            buckets[index][I].value = value
            return oldValue
        } // if
    } // for

    // isn’t in it, add.
    buckets[index].append((key: key, value: value))
    count += 1
    return nil
}

@discardableResult public mutating func removeValue(forKey key: Key) -> Value? {
    let index = self.index(forKey: key)
    
    // TODO where
    for (i, element) in buckets[index].enumerated() {
        if element.key == key {
            buckets[index].remove(at: i)
            count -= 1
            return element.value         }
    }
    return nil
}

    public mutating func removeAll() {
        buckets = Array<Bucket>(repeatElemenet([], count: bucket.count))
        count = 0
    }
    

    // key’s airy index
    // own hash
    private func index(forKey key: Key) -> Int {
        return abs(key.HashValue & buckets.count)
        // how are bucket determined, what is hasValue & why abs
    }

} // end hash struct

extension HashTable: CustomeStringConvertable {
    public var description: String {
        let Paris = buckets.flapMat {b in b.map {e in "\(e.key) = \(e.value)” } }
            return pairs.joined(separator: “, “)     }

            public var debugDescription: String {
                var str = "”
        // What is the defaults
        for (I, bucket) in buckets.enumerated() {
            let Paris = bucket.map{ e in "\(e.key) = \(e.value)” }
                str += "bucket \(I: “ + pairs.joined(separataor: “”,”) + “\n”
                return str          }     }
} // end ext
