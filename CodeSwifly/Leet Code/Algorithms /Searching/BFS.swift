//
//  BFS.swift
//  Leet
//
//  Created by Larissa Perara on 3/25/20.
//  Copyright © 2020 Larissa Perara. All rights reserved.
//

import Foundation

func search(_ graph: Graph, source: Node) -> [String] {
    var queue = Queue<Node>
}
// Time O(V+E)
final class BFS {
    func search(_ graph: Graph, source: Node) -> [String] {
      var queue = Queue<Node>()
      queue.enqueue(source)

      var nodesExplored = [source.label]
      source.visited = true

      while let node = queue.dequeue() {
        for edge in node.neighbors {
          let neighborNode = edge.neighbor
          if !neighborNode.visited {
            queue.enqueue(neighborNode)
            neighborNode.visited = true
            nodesExplored.append(neighborNode.label)
          }
        }
      }

      return nodesExplored
    }
}
