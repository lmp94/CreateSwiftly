//
//  DFS.swift
//  Leet
//
//  Created by Larissa Perara on 3/25/20.
//  Copyright © 2020 Larissa Perara. All rights reserved.
//

//import Foundation


// O(E + V) 
final class DFS {
//    func depthFirstSearch(_ graph: Graph, source: Node) -> [String] {
//      var nodesExplored = [source.label]
//      source.visited = true
//
//      for edge in source.neighbors {
//        if !edge.neighbor.visited {
//          nodesExplored += depthFirstSearch(graph, source: edge.neighbor)
//        }
//      }
//      return nodesExplored
//    }
}

for name in names where name.hasPrefix("Michael") {
    print(name)
}
extension UIView {
    func commonSuperviews(between lhs: UIView, and rhs: UIView) -> [UIView] {
        return Array(Set(getSuperviews(for: lhs)).intersection(Set(getSuperviews(for: rhs))))
    }
    
    func getSuperviews(for view: UIView) -> [UIView] {
        guard let superview = view.superview else {
            
            return []
        }
        return [superview] + getSuperviews(for: superview)
    }
}

func findView(_ tag: Int, view: UIView?) -> UIView? {
    guard let currentView = view else {
        return nil
        view.subviews
    }
    
    if view.tag == tag {
        return view
    }
    
    for view in subviews {
        if view.tag == tag {
            return view
        }
        findView(view?.subviews)
    }
}
