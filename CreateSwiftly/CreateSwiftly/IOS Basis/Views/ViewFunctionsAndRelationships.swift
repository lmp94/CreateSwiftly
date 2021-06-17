//
//  ViewFunctionsAndRelationships.swift
//  Leet
//
//  Created by Larissa Perara on 6/16/21.
//  Copyright © 2021 Larissa Perara. All rights reserved.
//

import Foundation
import UIKit

/**
            ------ UI Views Aricheture Overivew ------
  - Renders content within bounds rectangle (UIKit or Core Graphics, draw(=:))
  - Hanldes interaction within that context
 
  - Concrete class: instantiable, and
                    can display a fixed background color.
 
  - UIResponder Subclass: respond to touches & other types of events
  
  * Geometery: Frame & Bounds
     - Frame : defines origin & demensions of view in coordinate system of superview
     - Bounds: defines internal dimensions of the view as it seems them
                (exlusive to custom drawing code (?)
     - Center:
     (Note) Center property provides convient way to repoisiton a vewiw w/out changing frame/bounds directly (TODO)
        
  * Subviews of Views: 1 superview, 0+ subviews
     - Adjust size/position of subviews
     - AutoLayout: define rules for resizing/repositioning response
                   to changes in view hierarchy.
     - setNeedsDisplay(): mark view for updating next drawing cycle
        
  
   https://developer.apple.com/documentation/uikit/uiview
   View Delcaration:
    `@MainActor class UIView : UIResponder`
 */



class Parent: UIView {
    
    // clipToBounds: subviews visible area extends outside the vounds of its superview, default, it doesn't "clip", clipToBounds allows this to be set to true.
    // addSubview
    // insertSubview
    // Exchange
    
    
}

class Child: UIView {
}


