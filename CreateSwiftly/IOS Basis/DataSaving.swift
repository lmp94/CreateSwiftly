//
//  DataSaving.swift
//  CreateSwiftly
//
//  Created by Larissa Perara on 6/25/21.
//

import Foundation

// Both Core Datat & User Defaults are used to persist data,


/*
    User Defaults (key, value) [default, no exlict relationship to one another]
    
    When to use:
      - Best: Storing small chunks of data (commonly used in settigns/user preferences)
      - Worst: Large data stuctures, i.e. image data
    Storage Location: on disk, as a property list or plist (XML)
    Access: Contents of propety list in memory *at runtime* to improve performance
    
 **/
