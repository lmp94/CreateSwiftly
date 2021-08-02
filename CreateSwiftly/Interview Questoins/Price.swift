//
//  Price.swift
//  CreateSwiftly
//
//  Created by Larissa Perara on 7/22/21.
//

import Foundation

class Price {
    
}

// Is view Obscured
// Go through view hiracy

/**
 * Let's assume that you're consuming some login API that takes one closures as output (handling error and success).
 * You have an array of closures in your callsite that you want to collapse into one closure to pass into this API.
 * ex. would be `[logSomethingBlock, redirectSomethingBlockServerCodeEtc, performSegueBlockMainThread]`.
 *
 * Write the code that presents the login prompt from the API and passes in a collapsed version of the list of
 * blocks. By collapsed, I mean turn a list of async closures into one parallel closure with the same args which is successful
 * iff all listed closures are successful
 *
 * // API Definition
 * func showAPILoginViews(completion: (@escaping (success: Bool?, err: Error?) -> Void));
 *
 * ex.
 * [
 *   (completion: (@escaping (success: Bool?, err: Error?) -> Void)) in { callLogApi(); completion() },
 *   (completion: (@escaping (success: Bool?, err: Error?) -> Void)) in { sendMessageToServer(); completion() },
 *   (completion: (@escaping (success: Bool?, err: Error?) -> Void)) in { dispatch.main.async {performSegue(...)}; completion() },
 * ]
 * (success: Bool, err: Error) -> Void in { ... }
 */

// User call  present log
// log into Unicorn > call showAPILoginView (manage loggin errors) > save completion block > organize
// N

// MARK: Login API
/*
 // Provides single closure
 showAPILoginViews(completion: (@escaping (success: Bool, err: Error) -> Void)
 */


// MARK: Our code [Present Login]
// Given: list of async closures
// Task:
// - execute, track if they were sucess (aggregate)
// -



// list of closures
/* Write the code that presents the login prompt from the API and passes in a collapsed version of the list of
 * blocks. By collapsed, I mean turn a list of async closures into one parallel closure with the same args which is successful
 * iff all listed closures are successful*/
public func presentLogin( _ completions: [(@escaping (success: Bool?, err: Error?) -> Void)], finalCompletion: (@escaping (success: Bool?, err: Error?) -> Void)) {
    // indpendent, async
    let combined: ((success: Bool?, err: Error?) -> Void) = {
        // maybe it is in the right where aggreagation of success, error (first error you see)
        let count = completions.count // ignored mutex
        var finished: LockedInt = 0
        var failed: LockedBool = false
        for completion in completions {
            // put on a thread,
            dispatch.main.async {
                // for each completion executes step: handles error, (somehow) bubble up to the
                completion { success, error in
                    guard let succeded = success else {
                        logAssert("No success given")
                    }
                    
                    if success {
                        // success = do nothing, track completed ["tracking when I'm finsihed", so if there are no errors we know up (true, nil)]
                        finished = finished + 1
                        log("...")
                        if finished == count {
                            finalCompletion(true, nil)
                        }
                    }
                    else { // faliure = do not call more, but  & save [have I failed before]
                        log("\(success): \(erorr)")
                        if !failed {
                            // 1: First Faliure: this needs to propogated up to the user (normal complete)
                            failed = true
                            finalCompletion(success, error)
                        }
                        // 2: Process was started before a previous task failed, second failed task: just log, don't propogate up to the login UI
                    }
                }  // end of completion subtask
                
            } // async
            
        } // end of compeltion for
        
        API.showAPILoginView(combined)
        
        
    }

