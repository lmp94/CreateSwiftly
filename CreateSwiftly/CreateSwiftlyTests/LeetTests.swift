//
//  LeetTests.swift
//  LeetTests
//
//  Created by Larissa Perara on 3/17/20.
//  Copyright © 2020 Larissa Perara. All rights reserved.
//

import XCTest
@testable import Leet

class LeetTests: XCTestCase {
    
    //TODO currently you can only run one test per run without commenting out - be better lol - just reset in setup
        
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testMergeTwoSortedLists() {
        let list = MergeTwoSortedLists.shared
        let val = list.iterativly(list.createList([1,2,4]), list.createList([1,3,4]))
        compareLists(list.createList([1,1,2,3,4,4]), val)
    }
    
    func testThreeSum() {
        //let val = ThreeSum.shared.threeSum([-1, 0, 1, 2, -1, -4])
        //XCTAssertEqual([[-1,0,1],[-1,2,-1]], val)
        
       // let val2 = ThreeSum.shared.threeSum([-4,-2,-2,-2,0,1,2,2,2,3,3,4,4,6,6])
        // XCTAssertEqual([[-4,-2,6],[-4,0,4],[-4,1,3],[-4,2,2],[-2,-2,4],[-2,0,2]], val2)
        
        //let v3 = ThreeSum.shared.threeSum([-4,-2,1,-5,-4,-4,4,-2,0,4,0,-2,3,1,-5,0])
        ///print(v3)
    }

    func testNumerical() {
        XCTAssertEqual([1, 2], TwoSum.shared.bruteForceSwiftly([3,2,4], 6))
    }
    
    func testAddTwoNumbers() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let list = AddTwoNumbers.shared
        //let results = AddTwoNumbers.shared.recursivly(creatList([2,4,3]),creatList([5,6,4]))
        //compareLists(creatList([7, 0, 8]), results)
        
        let results2 = list.recursivly(list.createList([1,8]), list.createList([0]))
        compareLists(list.createList([1,8]), results2)
        
    }
    
    func testString() {
        // First unique character
        XCTAssertEqual(2, FirstUniqChar.shared.optimizeRunTime2("loveleetcode"))
        
        // Longest sub String
        XCTAssertEqual(3, LongestSubString.shared.withoutRepeatsOptimizeRuntime("abcabcbb"))
        XCTAssertEqual(3,  LongestSubString.shared.withoutRepeatsOptimizeRuntime("dvdf"))
    }
}

// MARK: - List Helpers

extension LeetTests {
    private func compareLists(_ expected: ListNode?, _ results: ListNode?) {
        guard let expected = expected, let results = results else {
            XCTFail()
            return
        }

        var eList = expected
        var rList = results
        
        XCTAssertEqual(expected.val, results.val)

        while let expectedNext = eList.next {
            eList = expectedNext
            
            guard let r_next = rList.next else {
                XCTFail("Failed, lists are not the same length")
                return
            }

            rList = r_next
            XCTAssertEqual(eList.val, rList.val)
       }
    }
}

