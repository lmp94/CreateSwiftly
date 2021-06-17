//
//  Queue.swift
//  Leet
//
//  Created by Larissa Perara on 3/25/20.
//  Copyright © 2020 Larissa Perara. All rights reserved.
//

import Foundation

/*
  First-in first-out queue (FIFO)
  New elements are added to the end of the queue. Dequeuing pulls elements from
  the front of the queue.
  Enqueuing is an O(1) operation, dequeuing is O(n). Note: If the queue had been
  implemented with a linked list, then both would be O(1).
*/
public struct SimpleQueue<T> {
  fileprivate var array = [T]()

  public var count: Int {
    return array.count
  }

  public var isEmpty: Bool {
    return array.isEmpty // Complexity: O(1)
  }

  public mutating func enqueue(_ element: T) {
   // Because arrays increase their allocated capacity using an exponential
    /// strategy,
    /// (1) Appending a single element to an array is an O(1) operation
    /// when averaged over many calls to the method.
    ///
    /// When an array has additional capacity and is not sharing its storage with another
    /// instance, appending an element is O(1).
    ///
    /// When an array needs to reallocate storage before appending or its storage is shared with
    /// another copy, appending is O(*n*)
    array.append(element)
  }

  public mutating func dequeue() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeFirst() // Complexity: O(*n*), where *n* is the length of the collection.
    }
  }

  public var front: T? {
    return array.first // nil if empty
  }
}

/*
  First-in first-out queue (FIFO)
  New elements are added to the end of the queue. Dequeuing pulls elements from
  the front of the queue.
  Enqueuing and dequeuing are O(1) operations.
*/
public struct OptimizedQueue<T> {
  fileprivate var array = [T?]()
  fileprivate var head = 0

  public var isEmpty: Bool {
    return count == 0
  }

  public var count: Int {
    return array.count - head
  }

  public mutating func enqueue(_ element: T) {
    array.append(element)
  }

  public mutating func dequeue() -> T? {
    guard let element = array[guarded: head] else {
        return nil
    }

    array[head] = nil
    head += 1

    let percentage = Double(head)/Double(array.count)
    if array.count > 50 && percentage > 0.25 {
      array.removeFirst(head)
      head = 0
    }

    return element
  }

  public var front: T? {
    if isEmpty {
      return nil
    } else {
      return array[head]
    }
  }
}

extension Array {
    subscript(guarded idx: Int) -> Element? {
        guard (startIndex..<endIndex).contains(idx) else {
            return nil
        }
        return self[idx]
    }
}
