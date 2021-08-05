//
//  QuickSort.swift
//  Leet
//
//  Created by Larissa Perara on 3/25/20.
//  Copyright © 2020 Larissa Perara. All rights reserved.
//

import Foundation

//   Easy to understand but not very efficient.
func quicksort<T: Comparable>(_ a: [T]) -> [T] {
  guard a.count > 1 else {
    return a
    
    }

  let pivot = a[a.count/2] // Current pivot is middle of the array - random perform often better 
  let less = a.filter { $0 < pivot }
  let equal = a.filter { $0 == pivot }
  let greater = a.filter { $0 > pivot }

  return quicksort(less) + equal + quicksort(greater)
}


