//
//  Concurrency.swift
//  CreateSwiftly
//
//  Created by Larissa Perara on 7/14/21.
//

import Foundation

final class ConcurrencyBasics {
}
    
    // MARK:- Defer Keyword
    // Defer was Introduced in Swift 2 to allow
    // something to execute at the end no matter what for exmaple.
    
extension ConcurrencyBasics {
    
    // MARK: Basic Defer Example
    
    func basicExample() {
        let file = openFile()
        defer { closeFile(file) } // Defer: Always close the file even if
                                  // a guard statemnt occurs.

        let status = fetch()
        guard hardwareStatus != "disaster" else { return }
        file.write(hardwareStatus)

        let softwareStatus =  fetch()
        guard softwareStatus != "disaster" else { return }
        file.write(softwareStatus)

        let networkStatus = fetch()
        guard neworkStatus != "disaster" else { return }
        file.write(networkStatus)
    }
    
    // MARK: Nested Defer Example.

    /* If we make one single call to multiple
        the execution will be as follows:
            Cat 1, Cat 2, Cat 4, Cat 3, Cat 5.
     
        The purpose of this example is to articulate
        the *scope* of defer. In these cases they
        are not based on the scope of the class,
        but the funciton itself.
     */
    
    func nested() {
        print("Cat 1") // 1
        nestedMultiple() // 2
        print("Cat 5") // 3
    }
    
    func nestedDefer() {
        print("Cat 2")// 2a
        defer { print("Cat 3") } //2c
        print("Cat 4") //2b
    }
    
    // MARK: Defer Common Scenarios
    
    func commonScenarios() {
        // In place of common "try, catch" scenarios
        // using the keyword "do" since the scope
        // of the variables for a "do" statment is between
        // the curly braces
        
        print("Dog 1") // 1
        
        do {
            defer {  print("Dog 2") } // 4
            print("Dog 3") // 2
            print("Dog 4") // 3
        }

        print("Dog 5") // 4
        
        // Loops i.e. at the end *do* something
        for i in 1..10 {
            print ("Start of Iteration #\(i)")
            defer{ print("Deferred \(i)") } // execute at the end of each loop iteration
            print ("End of Iteration #\(i)")
        }
    }
    
    // MARK: Multiple Defer Example.
    
    /* TLDR: Defers are placed on a stack, not a queue. When they are executed they are poppoed off the stack, meaning the most reccent defer you put on the stack comes off first etc.
       Why is this useful? "Unwinding the stack", you don't have to worry if another deferred was called first. 
       Caveot: Defers are not a goo place to exit the scope (i.e. return or error throwing)
     
     */

    func multiple() {
        //
    }
    // MARK:- Helper & Placeholder values
    
    func fetch() -> String {
        // placeholder
        return "go team"
    }
}
