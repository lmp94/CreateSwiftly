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
  /**
    The index each "bucket" is at determined by
        what index is returned when applying the
        hash function. If there are collision,
        simply add them to the Bucket at the index
        of Buckets.
   */
  
  private typealias Element = (key: Key, value: Value)
  private typealias Bucket: [Element] = [:]
  
  private var buckets: [Bucket]
  
  // # of K Pairs
  // this is tracking..... TODO:
  private (set) public var count = 0
  
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
      if let value = newValue {
        updateValue(value, forKey: key)
      }
      else { removeValue(forKey: key) }
    }
  }
  
  /**
     Takes in a Key object and returns a value for a given key if it exists.
     Returns nil when the item is not in the hash table.
   */
  // TODO: naming
  public func value(forKey key: Key) -> Value? {
    let index = self.index(forKey: key)
    for element in buckets[index] {
      if element.key = key {
        return element.value
      }
    }
    return nil
  }
  
  // TODO read up on discardableResult

  /**
    Takes a key and value, updating the value in the hashtabl
      with the value passed in for the given key.
   
    Returns the previous value that was being overriden if the
      key exisits in the HashTable, if not, return nil
      to indicate
   
     Returns nil when the item is not in the hash
      table. TODO: why this seems strange
   */
  @discardableResult public mutating func updateValue(_ value: Value,
                                                      forKey: Key) -> Value? {
    let index = self.index(forKey: key) // todo look up
    
    // Check if key is already in bucket
    /// TODO does this work, isn't it suppose to be nested
    for (i, element) in buckets[index].enumerated() {
      if element.key == key {
        let oldValue = element.value
        buckets[index][i].value = value
        return oldValue
      } // if
    } // for
    
    // isn’t in it, add.

    return nil
  }
  
  /**
      Private helper function to make sure that entries
        added are correctly accounted for.
   */
  
  // TODO could we override the append function / do this more swiftly?
  private func addEntry(_ forKey: Key, value: Value, atIndex: Int) {
    buckets[atIndex].append((key: key, value: value))
    count += 1
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
    }
  }
}
