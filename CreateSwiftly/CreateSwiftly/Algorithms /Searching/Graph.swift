//
//  Graph.swift
//  Leet
//
//  Created by Larissa Perara on 3/25/20.
//  Copyright © 2020 Larissa Perara. All rights reserved.
//

import Foundation

class Vertex<T> {
    let value: T
    var visited: Bool = false
    var adjacencyList: [Vertex] = []

    init(value: T) {
        self.value = value
    }
}
