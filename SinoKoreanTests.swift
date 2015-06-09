//
//  SinoKoreanKeyboardAppTests.swift
//  SinoKoreanKeyboardAppTests
//
//  Created by Dongyon Kang on 9/30/14.
//  Copyright (c) 2014 Dongyon Kang. All rights reserved.
//

import UIKit
import XCTest

class SinoKoreanKeyboardAppTests: XCTestCase {
    
    var sinoKoreanCharacter: SinoKoreanCharacter?
    var chosung: Chosung?
    var jungsung: Jungsung?
    var jongsung: Jongsung?
    var previousChar: String?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sinoKoreanCharacter = SinoKoreanCharacter()
        chosung = Chosung()
        jungsung = Jungsung()
        jongsung = Jongsung()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
    // SinoKoreanCharacter tests
    func testInitialization() {
        XCTAssert(sinoKoreanCharacter!.chosung!.isEmpty, "chosung should be empty")
        XCTAssert(sinoKoreanCharacter!.jungsung!.isEmpty, "jungsung should be empty")
        XCTAssert(sinoKoreanCharacter!.jongsung!.isEmpty, "jongsung should be empty")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "", "sinoKoreanCharacter should be empty")
    }
    func testInitialization_State() {
        XCTAssertEqual(sinoKoreanCharacter!.state, SKState.CHOSUNG_JUNGSUNG, "Initial state must be CHOSUNG_JUNGSUNG")
    }
    func testChosung_Complexifiable() {
        sinoKoreanCharacter!.add("ㄱ")
        XCTAssertEqual(sinoKoreanCharacter!.chosung!.rawString, "ㄱ", "chosung should be ㄱ")
        XCTAssert(sinoKoreanCharacter!.jungsung!.isEmpty, "jungsung should be empty")
        XCTAssert(sinoKoreanCharacter!.jongsung!.isEmpty, "jongsung should be empty")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㄱ", "sinoKoreanCharacter should be ㄱ")
    }
    func testChosung_Complexifiable_State() {
        sinoKoreanCharacter!.add("ㄱ")
        XCTAssertEqual(sinoKoreanCharacter!.state, SKState.CHOSUNG_JUNGSUNG, "After adding a chosung, state must be CHOSUNG_JUNGSUNG")
    }
    func testChosung_Uncomplexfiable1() {
        sinoKoreanCharacter!.add("ㄱ")
        sinoKoreanCharacter!.add("ㄱ")
        XCTAssertEqual(sinoKoreanCharacter!.chosung!.rawString, "ㄱㄱ", "chosung should be ㄱㄱ")
        XCTAssert(sinoKoreanCharacter!.jungsung!.isEmpty, "jungsung should be empty")
        XCTAssert(sinoKoreanCharacter!.jongsung!.isEmpty, "jongsung should be empty")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㄱㄱ", "sinoKoreanCharacter should be ㄱㄱ")
    }
    func testChosung_Uncomplexfiable1_State() {
        sinoKoreanCharacter!.add("ㄱ")
        sinoKoreanCharacter!.add("ㄱ")
        XCTAssertEqual(sinoKoreanCharacter!.state, SKState.JUNGSUNG_ONLY, "After adding two compatible chosungs, state should be JUNGSUNG_ONLY")
    }
    func testChosung_Uncomplexfiable2() {
        sinoKoreanCharacter!.add("ㅉ")
        XCTAssertEqual(sinoKoreanCharacter!.chosung!.rawString, "ㅉ", "chosung should be ㅉ")
        XCTAssert(sinoKoreanCharacter!.jungsung!.isEmpty, "jungsung should be empty")
        XCTAssert(sinoKoreanCharacter!.jongsung!.isEmpty, "jongsung should be empty")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅉ", "sinoKoreanCharacter should be ㅉ")
    }
    func testChosung_Uncomplexfiable2_State() {
        sinoKoreanCharacter!.add("ㅉ")
        XCTAssertEqual(sinoKoreanCharacter!.state, SKState.JUNGSUNG_ONLY, "After adding an uncomplexifiable chosung, state should be JUNGSUNG_ONLY")
    }
    func testChosung_Uncomplexfiable3() {
        sinoKoreanCharacter!.add("ㅎ")
        XCTAssertEqual(sinoKoreanCharacter!.chosung!.rawString, "ㅎ", "chosung should be ㅎ")
        XCTAssert(sinoKoreanCharacter!.jungsung!.isEmpty, "jungsung should be empty")
        XCTAssert(sinoKoreanCharacter!.jongsung!.isEmpty, "jongsung should be empty")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅎ", "sinoKoreanCharacter should be ㅎ")
    }
    func testChosung_Uncomplexfiable3_State() {
        sinoKoreanCharacter!.add("ㅎ")
        XCTAssertEqual(sinoKoreanCharacter!.state, SKState.JUNGSUNG_ONLY, "After adding an uncomplexifiable chosung, state should be JUNGSUNG_ONLY")
    }
    func testChosung_Incompatible() {
        sinoKoreanCharacter!.add("ㄱ")
        sinoKoreanCharacter!.add("ㄴ")
        XCTAssertEqual(sinoKoreanCharacter!.chosung!.rawString, "ㄴ", "chosung should be ㄴ")
        XCTAssert(sinoKoreanCharacter!.jungsung!.isEmpty, "jungsung should be empty")
        XCTAssert(sinoKoreanCharacter!.jongsung!.isEmpty, "jongsung should be empty")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㄴ", "sinoKoreanCharacter should be ㄴ")
    }
    func testChosung_Incompatible_State() {
        sinoKoreanCharacter!.add("ㄱ")
        sinoKoreanCharacter!.add("ㄴ")
        XCTAssertEqual(sinoKoreanCharacter!.state, SKState.JUNGSUNG_ONLY, "After adding two incompatible chosungs, state should be JUNGSUNG_ONLY")
    }
    func testJungsung_Complexifiable1() {
        sinoKoreanCharacter!.add("ㅏ")
        XCTAssert(sinoKoreanCharacter!.chosung!.isEmpty, "chosung should be empty")
        XCTAssertEqual(sinoKoreanCharacter!.jungsung!.rawString, "ㅏ", "jungsung should be ㅏ")
        XCTAssert(sinoKoreanCharacter!.jongsung!.isEmpty, "jongsung should be empty")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅏ", "sinoKoreanCharacter should be ㅏ")
    }
    func testJungsung_Complexifiable1_State() {
        sinoKoreanCharacter!.add("ㅏ")
        XCTAssertEqual(sinoKoreanCharacter!.state, SKState.JUNGSUNG_ONLY, "After adding a jungsung, state should be JUNGSUNG_ONLY")
    }
    func testJungsung_Complexifiable2() {
        sinoKoreanCharacter!.add("ㅜ")
        sinoKoreanCharacter!.add("ㅓ")
        XCTAssert(sinoKoreanCharacter!.chosung!.isEmpty, "chosung should be empty")
        XCTAssertEqual(sinoKoreanCharacter!.jungsung!.rawString, "ㅜㅓ", "jungsung should be ㅏ")
        XCTAssert(sinoKoreanCharacter!.jongsung!.isEmpty, "jongsung should be empty")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅜㅓ", "sinoKoreanCharacter should be ㅜㅓ")
    }
    func testJungsung_Complexifiable2_State() {
        sinoKoreanCharacter!.add("ㅜ")
        sinoKoreanCharacter!.add("ㅓ")
        XCTAssertEqual(sinoKoreanCharacter!.state, SKState.JUNGSUNG_ONLY, "After adding a jungsung, state should be JUNGSUNG_ONLY")
    }
    func testJungsung_Uncomplexifiable1() {
        sinoKoreanCharacter!.add("ㅏ")
        sinoKoreanCharacter!.add("ㅣ")
        XCTAssert(sinoKoreanCharacter!.chosung!.isEmpty, "chosung should be empty")
        XCTAssertEqual(sinoKoreanCharacter!.jungsung!.rawString, "ㅏㅣ", "jungsung should be ㅏㅣ")
        XCTAssert(sinoKoreanCharacter!.jongsung!.isEmpty, "jongsung should be empty")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅏㅣ", "sinoKoreanCharacter should be ㅏㅣ")
    }
    func testJungsung_Uncomplexifiable1_State() {
        sinoKoreanCharacter!.add("ㅏ")
        sinoKoreanCharacter!.add("ㅣ")
        XCTAssertEqual(sinoKoreanCharacter!.state, SKState.COMPLETE, "After adding two compatible jungsungs, state should be COMPLETE")
    }
    func testJungsung_Uncomplexifiable2() {
        sinoKoreanCharacter!.add("ㅣ")
        XCTAssert(sinoKoreanCharacter!.chosung!.isEmpty, "chosung should be empty")
        XCTAssertEqual(sinoKoreanCharacter!.jungsung!.rawString, "ㅣ", "jungsung should be ㅣ")
        XCTAssert(sinoKoreanCharacter!.jongsung!.isEmpty, "jongsung should be empty")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅣ", "sinoKoreanCharacter should be ㅣ")
    }
    func testJungsung_Uncomplexifiable2_State() {
        sinoKoreanCharacter!.add("ㅣ")
        XCTAssertEqual(sinoKoreanCharacter!.state, SKState.COMPLETE, "After adding an uncomplexifiable jungsung, state should be COMPLETE")
    }
    func testJungsung_Uncomplexifiable3() {
        sinoKoreanCharacter!.add("ㅜ")
        sinoKoreanCharacter!.add("ㅓ")
        sinoKoreanCharacter!.add("ㅣ")
        XCTAssert(sinoKoreanCharacter!.chosung!.isEmpty, "chosung should be empty")
        XCTAssertEqual(sinoKoreanCharacter!.jungsung!.rawString, "ㅜㅓㅣ", "jungsung should be ㅣ")
        XCTAssert(sinoKoreanCharacter!.jongsung!.isEmpty, "jongsung should be empty")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅜㅓㅣ", "sinoKoreanCharacter should be ㅜㅓㅣ")
    }
    func testJungsung_Uncomplexifiable3_State() {
        sinoKoreanCharacter!.add("ㅜ")
        sinoKoreanCharacter!.add("ㅓ")
        sinoKoreanCharacter!.add("ㅣ")
        XCTAssertEqual(sinoKoreanCharacter!.state, SKState.COMPLETE, "After adding an uncomplexifiable jungsung, state should be COMPLETE")
    }
    func testChosungJungsung1() {
        sinoKoreanCharacter!.add("ㄱ")
        sinoKoreanCharacter!.add("ㅏ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㄱㅏ", "sinoKoreanCharacter should be ㄱㅏ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "가", "sinoKoreanCharacter should be 가")
    }
    func testChosungJungsung2() {
        sinoKoreanCharacter!.add("ㅎ")
        sinoKoreanCharacter!.add("ㅣ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅎㅣ", "sinoKoreanCharacter should be ㅎㅣ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "히", "sinoKoreanCharacter should be 히")
    }
    func testChosungJungsungJongsung1() {
        sinoKoreanCharacter!.add("ㄱ")
        sinoKoreanCharacter!.add("ㅏ")
        sinoKoreanCharacter!.add("ㄱ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㄱㅏㄱ", "sinoKoreanCharacter should be ㄱㅏㄱ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "각", "sinoKoreanCharacter should be 각")
    }
    func testChosungJungsungJongsung2() {
        sinoKoreanCharacter!.add("ㅎ")
        sinoKoreanCharacter!.add("ㅣ")
        sinoKoreanCharacter!.add("ㅎ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅎㅣㅎ", "sinoKoreanCharacter should be ㅎㅣㅎ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "힣", "sinoKoreanCharacter should be 힣")
    }
    func testComplexifiedChosungJungsungJongsung1() {
        sinoKoreanCharacter!.add("ㄱ")
        sinoKoreanCharacter!.add("ㄱ")
        sinoKoreanCharacter!.add("ㅏ")
        sinoKoreanCharacter!.add("ㄱ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㄱㄱㅏㄱ", "sinoKoreanCharacter should be ㄱㄱㅏㄱ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "깍", "sinoKoreanCharacter should be 깍")
    }
    func testComplexifiedChosungJungsungJongsung2() {
        sinoKoreanCharacter!.add("ㅈ")
        sinoKoreanCharacter!.add("ㅈ")
        sinoKoreanCharacter!.add("ㅏ")
        sinoKoreanCharacter!.add("ㅎ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅈㅈㅏㅎ", "sinoKoreanCharacter should be ㅈㅈㅏㅎ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "짷", "sinoKoreanCharacter should be 짷")
    }
    func testComplexifiedChosungComplexifiedJungsungJongsung1() {
        sinoKoreanCharacter!.add("ㄱ")
        sinoKoreanCharacter!.add("ㄱ")
        sinoKoreanCharacter!.add("ㅏ")
        sinoKoreanCharacter!.add("ㅣ")
        sinoKoreanCharacter!.add("ㄱ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㄱㄱㅏㅣㄱ", "sinoKoreanCharacter should be ㄱㄱㅏㅣㄱ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "깩", "sinoKoreanCharacter should be 깩")
    }
    func testComplexifiedChosungComplexifiedJungsungJongsung2() {
        sinoKoreanCharacter!.add("ㄱ")
        sinoKoreanCharacter!.add("ㄱ")
        sinoKoreanCharacter!.add("ㅗ")
        sinoKoreanCharacter!.add("ㅏ")
        sinoKoreanCharacter!.add("ㅣ")
        sinoKoreanCharacter!.add("ㄱ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㄱㄱㅗㅏㅣㄱ", "sinoKoreanCharacter should be ㄱㄱㅗㅏㅣㄱ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "꽥", "sinoKoreanCharacter should be 꽥")
    }
    func testComplexifiedChosungComplexifiedJungsungJongsung3() {
        sinoKoreanCharacter!.add("ㄱ")
        sinoKoreanCharacter!.add("ㄱ")
        sinoKoreanCharacter!.add("ㅗ")
        sinoKoreanCharacter!.add("ㅏ")
        sinoKoreanCharacter!.add("ㄱ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㄱㄱㅗㅏㄱ", "sinoKoreanCharacter should be ㄱㄱㅗㅏㄱ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "꽉", "sinoKoreanCharacter should be 꽉")
    }
    func testComplexifiedChosungComplexifiedJungsungComplexifiedJongsung1() {
        sinoKoreanCharacter!.add("ㄱ")
        sinoKoreanCharacter!.add("ㄱ")
        sinoKoreanCharacter!.add("ㅗ")
        sinoKoreanCharacter!.add("ㅏ")
        sinoKoreanCharacter!.add("ㅣ")
        sinoKoreanCharacter!.add("ㄱ")
        sinoKoreanCharacter!.add("ㅅ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㄱㄱㅗㅏㅣㄱㅅ", "sinoKoreanCharacter should be ㄱㄱㅗㅏㅣㄱㅅ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "꽧", "sinoKoreanCharacter should be 꽧")
    }
    func testComplexifiedChosungComplexifiedJungsungComplexifiedJongsung2() {
        sinoKoreanCharacter!.add("ㅈ")
        sinoKoreanCharacter!.add("ㅈ")
        sinoKoreanCharacter!.add("ㅜ")
        sinoKoreanCharacter!.add("ㅓ")
        sinoKoreanCharacter!.add("ㅣ")
        sinoKoreanCharacter!.add("ㄹ")
        sinoKoreanCharacter!.add("ㅎ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅈㅈㅜㅓㅣㄹㅎ", "sinoKoreanCharacter should be ㅈㅈㅜㅓㅣㄹㅎ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "쮏", "sinoKoreanCharacter should be 쮏")
    }
    func testComplexifiedChosungComplexifiedJungsungComplexifiedJongsung3() {
        sinoKoreanCharacter!.add("ㅉ")
        sinoKoreanCharacter!.add("ㅞ")
        sinoKoreanCharacter!.add("ㄹ")
        sinoKoreanCharacter!.add("ㅎ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅉㅞㄹㅎ", "sinoKoreanCharacter should be ㅉㅞㄹㅎ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "쮏", "sinoKoreanCharacter should be 쮏")
    }
    func testComplexifiedChosungComplexifiedJungsungComplexifiedJongsung4() {
        sinoKoreanCharacter!.add("ㅉ")
        sinoKoreanCharacter!.add("ㅝ")
        sinoKoreanCharacter!.add("ㅣ")
        sinoKoreanCharacter!.add("ㄹ")
        sinoKoreanCharacter!.add("ㅎ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅉㅝㅣㄹㅎ", "sinoKoreanCharacter should be ㅉㅝㅣㄹㅎ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "쮏", "sinoKoreanCharacter should be 쮏")
    }
    func testJungsungChosung() {
        sinoKoreanCharacter!.add("ㅣ")
        previousChar = sinoKoreanCharacter!.add("ㄱ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㄱ", "sinoKoreanCharacter should be ㄱ")
        XCTAssertEqual(previousChar!, "\u{1175}", "previousChar should be \u{1175}")
    }
    func testRemove1() {
        sinoKoreanCharacter!.add("ㅈ")
        sinoKoreanCharacter!.add("ㅈ")
        sinoKoreanCharacter!.add("ㅜ")
        sinoKoreanCharacter!.add("ㅓ")
        sinoKoreanCharacter!.add("ㅣ")
        sinoKoreanCharacter!.add("ㄹ")
        sinoKoreanCharacter!.add("ㅎ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅈㅈㅜㅓㅣㄹㅎ", "sinoKoreanCharacter should be ㅈㅈㅜㅓㅣㄹㅎ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "쮏", "sinoKoreanCharacter should be 쮏")
        XCTAssertEqual(sinoKoreanCharacter!.remove(), "ㅎ", "removed character should be ㅎ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅈㅈㅜㅓㅣㄹ", "sinoKoreanCharacter should be ㅈㅈㅜㅓㅣㄹ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "쮈", "sinoKoreanCharacter should be 쮈")
        XCTAssertEqual(sinoKoreanCharacter!.remove(), "ㄹ", "removed character should be ㄹ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅈㅈㅜㅓㅣ", "sinoKoreanCharacter should be ㅈㅈㅜㅓㅣ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "쮀", "sinoKoreanCharacter should be 쮀")
        XCTAssertEqual(sinoKoreanCharacter!.remove(), "ㅣ", "removed character should be ㅣ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅈㅈㅜㅓ", "sinoKoreanCharacter should be ㅈㅈㅜㅓ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "쭤", "sinoKoreanCharacter should be 쭤")
        XCTAssertEqual(sinoKoreanCharacter!.remove(), "ㅓ", "removed character should be ㅓ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅈㅈㅜ", "sinoKoreanCharacter should be ㅈㅈㅜ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "쭈", "sinoKoreanCharacter should be 쭈")
        XCTAssertEqual(sinoKoreanCharacter!.remove(), "ㅜ", "removed character should be ㅜ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅈㅈ", "sinoKoreanCharacter should be ㅈㅈ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "\u{110D}", "sinoKoreanCharacter should be \u{110D}")
        XCTAssertEqual(sinoKoreanCharacter!.remove(), "ㅈ", "removed character should be ㅈ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅈ", "sinoKoreanCharacter should be ㅈ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "\u{110C}", "sinoKoreanCharacter should be \u{110C}")
        XCTAssertEqual(sinoKoreanCharacter!.remove(), "ㅈ", "removed character should be ㅈ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "", "sinoKoreanCharacter should be \"\"")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "", "sinoKoreanCharacter should be \"\"")
    }
    func testRemove2() {
        sinoKoreanCharacter!.add("ㅉ")
        sinoKoreanCharacter!.add("ㅝ")
        sinoKoreanCharacter!.add("ㅣ")
        sinoKoreanCharacter!.add("ㄹ")
        sinoKoreanCharacter!.add("ㅎ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅉㅝㅣㄹㅎ", "sinoKoreanCharacter should be ㅉㅝㅣㄹㅎ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "쮏", "sinoKoreanCharacter should be 쮏")
        XCTAssertEqual(sinoKoreanCharacter!.remove(), "ㅎ", "removed character should be ㅎ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅉㅝㅣㄹ", "sinoKoreanCharacter should be ㅉㅝㅣㄹ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "쮈", "sinoKoreanCharacter should be 쮈")
        XCTAssertEqual(sinoKoreanCharacter!.remove(), "ㄹ", "removed character should be ㄹ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅉㅝㅣ", "sinoKoreanCharacter should be ㅉㅝㅣ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "쮀", "sinoKoreanCharacter should be 쮀")
        XCTAssertEqual(sinoKoreanCharacter!.remove(), "ㅣ", "removed character should be ㅣ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅉㅝ", "sinoKoreanCharacter should be ㅉㅝ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "쭤", "sinoKoreanCharacter should be 쭤")
        XCTAssertEqual(sinoKoreanCharacter!.remove(), "ㅝ", "removed character should be ㅝ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "ㅉ", "sinoKoreanCharacter should be ㅉ")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "\u{110D}", "sinoKoreanCharacter should be \u{110D}")
        XCTAssertEqual(sinoKoreanCharacter!.remove(), "ㅉ", "removed character should be ㅉ")
        XCTAssertEqual(sinoKoreanCharacter!.rawString, "", "sinoKoreanCharacter should be \"\"")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "", "sinoKoreanCharacter should be \"\"")
    }
    func testTwoCharacters1() {
        sinoKoreanCharacter!.add("ㅎ")
        sinoKoreanCharacter!.add("ㅣ")
        sinoKoreanCharacter!.add("ㅎ")
        previousChar = sinoKoreanCharacter!.add("ㅣ")
        XCTAssertEqual(previousChar!, "히", "previous character should be 히")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "히", "sinoKoreanCharacter should be 히")
    }
    func testTwoCharacters2() {
        sinoKoreanCharacter!.add("ㅎ")
        sinoKoreanCharacter!.add("ㅏ")
        sinoKoreanCharacter!.add("ㄱ")
        sinoKoreanCharacter!.add("ㄱ")
        previousChar = sinoKoreanCharacter!.add("ㅛ")
        XCTAssertEqual(previousChar!, "학", "previous character should be 학")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "교", "sinoKoreanCharacter should be 교")
    }
    func testTwoCharacters3() {
        sinoKoreanCharacter!.add("ㄱ")
        sinoKoreanCharacter!.add("ㅡ")
        sinoKoreanCharacter!.add("ㄹ")
        previousChar = sinoKoreanCharacter!.add("ㅓ")
        XCTAssertEqual(previousChar!, "그", "previous character should be 그")
        XCTAssertEqual(sinoKoreanCharacter!.actualString, "러", "sinoKoreanCharacter should be 러")
    }
    
    // SinoKoreanLetter tests
    // Chosung
    func testChosung_Validity_OneJaum() {
        chosung!.add("ㄱ")
        XCTAssertEqual(chosung!.rawString, "ㄱ", "Chosung should be ㄱ")
        XCTAssertEqual(chosung!.letter, "\u{1100}", "Chosung should be \u{1100}")
    }
    func testChosung_Validity_TwoJaums() {
        chosung!.add("ㄱ")
        chosung!.add("ㄱ")
        XCTAssertEqual(chosung!.rawString, "ㄱㄱ", "Chosung should be ㄱㄱ")
        XCTAssertEqual(chosung!.letter, "\u{1101}", "Chosung should be \u{1101}")
    }
    func testChosung_Validity_ThreeJaums() {
        chosung!.add("ㄱ")
        chosung!.add("ㄱ")
        chosung!.add("ㄱ")
        XCTAssertEqual(chosung!.rawString, "ㄱㄱ", "Chosung should be ㄱㄱ")
        XCTAssertEqual(chosung!.letter, "\u{1101}", "Chosung should be \u{1101}")
    }
    func testChosung_Validity_ComplexJaum1() {
        chosung!.add("ㄲ")
        XCTAssertEqual(chosung!.rawString, "ㄲ", "Chosung should be ㄲ")
        XCTAssertEqual(chosung!.letter, "\u{1101}", "Chosung should be \u{1101}")
    }
    func testChosung_Validity_ComplexJaum2() {
        chosung!.add("ㅉ")
        XCTAssertEqual(chosung!.rawString, "ㅉ", "Chosung should be ㅉ")
        XCTAssertEqual(chosung!.letter, "\u{110D}", "Chosung should be \u{110D}")
    }
    func testChosung_Validity_ValidPartners() {
        chosung!.add("ㄷ")
        chosung!.add("ㄷ")
        XCTAssertEqual(chosung!.rawString, "ㄷㄷ", "Chosung should be ㄷㄷ")
        XCTAssertEqual(chosung!.letter, "\u{1104}", "Chosung should be \u{1104}")
    }
    func testChosung_Validity_InvalidPartners() {
        chosung!.add("ㄱ")
        chosung!.add("ㄴ")
        XCTAssertEqual(chosung!.rawString, "ㄱ", "Chosung should be ㄱ")
        XCTAssertEqual(chosung!.letter, "\u{1100}", "Chosung should be \u{1100}")
    }
    func testChosung_Validity_Moum() {
        chosung!.add("ㅏ")
        XCTAssertEqual(chosung!.rawString, "", "Chosung should be empty")
        XCTAssertEqual(chosung!.letter, "", "Chosung should be empty")
    }
    func testChosung_canAdd_true1() {
        XCTAssertEqual(chosung!.rawString, "", "Chosung should be empty")
        XCTAssertEqual(chosung!.letter, "", "Chosung should be empty")
        XCTAssert(chosung!.complexifiable, "Chosung has nothing - it should be complexifiable")
    }
    func testChosung_canAdd_true2() {
        chosung!.add("ㄱ")
        XCTAssertEqual(chosung!.rawString, "ㄱ", "Chosung should be ㄱ")
        XCTAssertEqual(chosung!.letter, "\u{1100}", "Chosung should be \u{1100}")
        XCTAssert(chosung!.complexifiable, "Chosung has ㄱ - it should be complexifiable")
    }
    func testChosung_canAdd_true3() {
        chosung!.add("ㄱ")
        chosung!.add("ㄴ")
        XCTAssertEqual(chosung!.rawString, "ㄱ", "Chosung should be ㄱ")
        XCTAssertEqual(chosung!.letter, "\u{1100}", "Chosung should be \u{1100}")
        XCTAssert(chosung!.complexifiable, "Chosung has ㄱ - it should be complexifiable")
    }
    func testChosung_canAdd_true4() {
        chosung!.add("ㄱ")
        chosung!.add("ㄴ")
        chosung!.add("ㄷ")
        XCTAssertEqual(chosung!.rawString, "ㄱ", "Chosung should be ㄱ")
        XCTAssertEqual(chosung!.letter, "\u{1100}", "Chosung should be \u{1100}")
        XCTAssert(chosung!.complexifiable, "Chosung has ㄱ - it should be complexifiable")
    }
    func testChosung_canAdd_false1() {
        chosung!.add("ㄱ")
        chosung!.add("ㄱ")
        XCTAssertEqual(chosung!.rawString, "ㄱㄱ", "Chosung should be ㄱㄱ")
        XCTAssertEqual(chosung!.letter, "\u{1101}", "Chosung should be \u{1101}")
        XCTAssertFalse(chosung!.complexifiable, "Chosung has ㄱㄱ - it should not be complexifiable")
    }
    func testChosung_canAdd_false2() {
        chosung!.add("ㄱ")
        chosung!.add("ㄴ")
        chosung!.add("ㄱ")
        XCTAssertEqual(chosung!.rawString, "ㄱㄱ", "Chosung should be ㄱㄱ")
        XCTAssertEqual(chosung!.letter, "\u{1101}", "Chosung should be \u{1101}")
        XCTAssertFalse(chosung!.complexifiable, "Chosung has ㄱㄱ - it should not be complexifiable")
    }
    func testChosung_letter1() {
        chosung!.add("ㄱ")
        XCTAssertEqual(chosung!.letter, "\u{1100}", "Chosung should be \u{1100}")
    }
    func testChosung_letter2() {
        chosung!.add("ㅎ")
        XCTAssertEqual(chosung!.letter, "\u{1112}", "Chosung should be \u{1112}")
    }
    func testChosung_Remove1() {
        chosung!.add("ㄷ")
        chosung!.add("ㄷ")
        XCTAssertEqual(chosung!.rawString, "ㄷㄷ", "Chosung should be ㄷㄷ")
        XCTAssertEqual(chosung!.letter, "\u{1104}", "Chosung should be \u{1104}")
        XCTAssertEqual(chosung!.remove(), "ㄷ", "removed character should be ㄷ")
        XCTAssertEqual(chosung!.rawString, "ㄷ", "Chosung should be ㄷ")
        XCTAssertEqual(chosung!.letter, "\u{1103}", "Chosung should be \u{1103}")
    }
    func testChosung_Remove2() {
        chosung!.add("ㄷ")
        chosung!.add("ㄷ")
        XCTAssertEqual(chosung!.rawString, "ㄷㄷ", "Chosung should be ㄷㄷ")
        XCTAssertEqual(chosung!.letter, "\u{1104}", "Chosung should be \u{1104}")
        XCTAssertEqual(chosung!.remove(), "ㄷ", "removed character should be ㄷ")
        XCTAssertEqual(chosung!.remove(), "ㄷ", "removed character should be ㄷ")
        XCTAssertEqual(chosung!.rawString, "", "Chosung should be \"\"")
        XCTAssertEqual(chosung!.letter, "", "Chosung should be \"\"")
    }
    func testChosung_RemoveAll() {
        chosung!.add("ㄷ")
        chosung!.add("ㄷ")
        XCTAssertEqual(chosung!.rawString, "ㄷㄷ", "Chosung should be ㄷㄷ")
        XCTAssertEqual(chosung!.letter, "\u{1104}", "Chosung should be \u{1104}")
        chosung!.removeAll()
        XCTAssertEqual(chosung!.rawString, "", "Chosung should be \"\"")
        XCTAssertEqual(chosung!.letter, "", "Chosung should be \"\"")
    }
    
    // Jungsung
    func testJungsung_Validity_OneMoum() {
        jungsung!.add("ㅏ")
        XCTAssertEqual(jungsung!.rawString, "ㅏ", "Jungsung should be ㅏ")
        XCTAssertEqual(jungsung!.letter, "\u{1161}", "Jungsung should be \u{1161}")
    }
    func testJungsung_Validity_TwoMoums() {
        jungsung!.add("ㅏ")
        jungsung!.add("ㅣ")
        XCTAssertEqual(jungsung!.rawString, "ㅏㅣ", "Jungsung should be ㅏㅣ")
        XCTAssertEqual(jungsung!.letter, "\u{1162}", "Jungsung should be \u{1162}")
    }
    func testJungsung_Validity_ThreeMoums() {
        jungsung!.add("ㅗ")
        jungsung!.add("ㅏ")
        jungsung!.add("ㅣ")
        XCTAssertEqual(jungsung!.rawString, "ㅗㅏㅣ", "Jungsung should be ㅗㅏㅣ")
        XCTAssertEqual(jungsung!.letter, "\u{116B}", "Jungsung should be \u{116B}")
    }
    func testJungsung_Validity_ValidPartners() {
        jungsung!.add("ㅜ")
        jungsung!.add("ㅓ")
        XCTAssertEqual(jungsung!.rawString, "ㅜㅓ", "Jungsung should be ㅜㅓ")
        XCTAssertEqual(jungsung!.letter, "\u{116F}", "Jungsung should be \u{116F}")
    }
    func testJungsung_Validity_InvalidPartners() {
        jungsung!.add("ㅏ")
        jungsung!.add("ㅏ")
        XCTAssertEqual(jungsung!.rawString, "ㅏ", "Jungsung should be ㅏ")
        XCTAssertEqual(jungsung!.letter, "\u{1161}", "Jungsung should be \u{1161}")
    }
    func testJungsung_Validity_Jaum() {
        jungsung!.add("ㄱ")
        XCTAssertEqual(jungsung!.rawString, "", "Jungsung should be \"\"")
        XCTAssertEqual(jungsung!.letter, "", "Jungsung should be \"\"")
    }
    func testJungsung_canAdd_true1() {
        XCTAssertEqual(jungsung!.rawString, "", "Jungsung should be \"\"")
        XCTAssert(jungsung!.complexifiable, "Jungsung has nothing - it should be complexifiable")
    }
    func testJungsung_canAdd_true2() {
        jungsung!.add("ㅏ")
        XCTAssertEqual(jungsung!.rawString, "ㅏ", "Jungsung should be ㅏ")
        XCTAssertEqual(jungsung!.letter, "\u{1161}", "Jungsung should be \u{1161}")
        XCTAssert(jungsung!.complexifiable, "Jungsung has ㅏ - it should be complexifiable")
    }
    func testJungsung_canAdd_true3() {
        jungsung!.add("ㅏ")
        jungsung!.add("ㅏ")
        XCTAssertEqual(jungsung!.rawString, "ㅏ", "Jungsung should be ㅏ")
        XCTAssertEqual(jungsung!.letter, "\u{1161}", "Jungsung should be \u{1161}")
        XCTAssert(jungsung!.complexifiable, "Jungsung has ㅏ - it should be complexifiable")
    }
    func testJungsung_canAdd_true4() {
        jungsung!.add("ㅏ")
        jungsung!.add("ㅏ")
        jungsung!.add("ㅏ")
        XCTAssertEqual(jungsung!.rawString, "ㅏ", "Jungsung should be ㅏ")
        XCTAssertEqual(jungsung!.letter, "\u{1161}", "Jungsung should be \u{1161}")
        XCTAssert(jungsung!.complexifiable, "Jungsung has ㅏ - it should be complexifiable")
    }
    func testJungsung_canAdd_true5() {
        jungsung!.add("ㅗ")
        XCTAssertEqual(jungsung!.rawString, "ㅗ", "Jungsung should be ㅗ")
        XCTAssertEqual(jungsung!.letter, "\u{1169}", "Jungsung should be \u{1169}")
        XCTAssert(jungsung!.complexifiable, "Jungsung has ㅗ - it should be complexifiable")
    }
    func testJungsung_canAdd_true6() {
        jungsung!.add("ㅗ")
        jungsung!.add("ㅏ")
        XCTAssertEqual(jungsung!.rawString, "ㅗㅏ", "Jungsung should be ㅗㅏ")
        XCTAssertEqual(jungsung!.letter, "\u{116A}", "Jungsung should be \u{116A}")
        XCTAssert(jungsung!.complexifiable, "Jungsung has ㅗㅏ - it should be complexifiable")
    }
    func testJungsung_canAdd_true7() {
        jungsung!.add("ㅗ")
        jungsung!.add("ㅏ")
        jungsung!.add("ㅏ")
        XCTAssertEqual(jungsung!.rawString, "ㅗㅏ", "Jungsung should be ㅗㅏ")
        XCTAssertEqual(jungsung!.letter, "\u{116A}", "Jungsung should be \u{116A}")
        XCTAssert(jungsung!.complexifiable, "Jungsung has ㅗㅏ - it should be complexifiable")
    }
    func testJungsung_canAdd_false1() {
        jungsung!.add("ㅗ")
        jungsung!.add("ㅏ")
        jungsung!.add("ㅣ")
        XCTAssertEqual(jungsung!.rawString, "ㅗㅏㅣ", "Jungsung should be ㅗㅏㅣ")
        XCTAssertEqual(jungsung!.letter, "\u{116B}", "Jungsung should be \u{116B}")
        XCTAssertFalse(jungsung!.complexifiable, "Jungsung has ㅗㅏㅣ - it should not be complexifiable")
    }
    func testJungsung_canAdd_false2() {
        jungsung!.add("ㅏ")
        jungsung!.add("ㅣ")
        XCTAssertEqual(jungsung!.rawString, "ㅏㅣ", "Jungsung should be ㅏㅣ")
        XCTAssertEqual(jungsung!.letter, "\u{1162}", "Jungsung should be \u{1162}")
        XCTAssertFalse(jungsung!.complexifiable, "Jungsung has ㅏㅣ - it should not be complexifiable")
    }
    func testJungsung_canAdd_false3() {
        jungsung!.add("ㅗ")
        jungsung!.add("ㅜ")
        jungsung!.add("ㅏ")
        jungsung!.add("ㅣ")
        XCTAssertEqual(jungsung!.rawString, "ㅗㅏㅣ", "Jungsung should be ㅗㅏㅣ")
        XCTAssertEqual(jungsung!.letter, "\u{116B}", "Jungsung should be \u{116B}")
        XCTAssertFalse(jungsung!.complexifiable, "Jungsung has ㅗㅏㅣ - it should not be complexifiable")
    }
    func testJungsung_letter1() {
        jungsung!.add("ㅏ")
        XCTAssertEqual(jungsung!.letter, "\u{1161}", "Chosung should be \u{1161}")
    }
    func testJungsung_letter2() {
        jungsung!.add("ㅣ")
        XCTAssertEqual(jungsung!.letter, "\u{1175}", "Chosung should be \u{1175}")
    }
    func testJungsung_Remove1() {
        jungsung!.add("ㅗ")
        jungsung!.add("ㅏ")
        jungsung!.add("ㅣ")
        XCTAssertEqual(jungsung!.rawString, "ㅗㅏㅣ", "Jungsung should be ㅗㅏㅣ")
        XCTAssertEqual(jungsung!.letter, "\u{116B}", "Jungsung should be \u{116B}")
        XCTAssertEqual(jungsung!.remove(), "ㅣ", "removed character should be ㅣ")
        XCTAssertEqual(jungsung!.rawString, "ㅗㅏ", "Jungsung should be ㅗㅏ")
        XCTAssertEqual(jungsung!.letter, "\u{116A}", "Jungsung should be \u{116A}")
    }
    func testJungsung_Remove2() {
        jungsung!.add("ㅗ")
        jungsung!.add("ㅏ")
        jungsung!.add("ㅣ")
        XCTAssertEqual(jungsung!.rawString, "ㅗㅏㅣ", "Jungsung should be ㅗㅏㅣ")
        XCTAssertEqual(jungsung!.letter, "\u{116B}", "Jungsung should be \u{116B}")
        XCTAssertEqual(jungsung!.remove(), "ㅣ", "removed character should be ㅣ")
        XCTAssertEqual(jungsung!.rawString, "ㅗㅏ", "Jungsung should be ㅗㅏ")
        XCTAssertEqual(jungsung!.letter, "\u{116A}", "Jungsung should be \u{116A}")
        XCTAssertEqual(jungsung!.remove(), "ㅏ", "removed character should be ㅏ")
        XCTAssertEqual(jungsung!.rawString, "ㅗ", "Jungsung should be ㅗ")
        XCTAssertEqual(jungsung!.letter, "\u{1169}", "Jungsung should be \u{1169}")
    }
    func testJungsung_Remove3() {
        jungsung!.add("ㅗ")
        jungsung!.add("ㅏ")
        jungsung!.add("ㅣ")
        XCTAssertEqual(jungsung!.rawString, "ㅗㅏㅣ", "Jungsung should be ㅗㅏㅣ")
        XCTAssertEqual(jungsung!.letter, "\u{116B}", "Jungsung should be \u{116B}")
        XCTAssertEqual(jungsung!.remove(), "ㅣ", "removed character should be ㅣ")
        XCTAssertEqual(jungsung!.rawString, "ㅗㅏ", "Jungsung should be ㅗㅏ")
        XCTAssertEqual(jungsung!.letter, "\u{116A}", "Jungsung should be \u{116A}")
        XCTAssertEqual(jungsung!.remove(), "ㅏ", "removed character should be ㅏ")
        XCTAssertEqual(jungsung!.rawString, "ㅗ", "Jungsung should be ㅗ")
        XCTAssertEqual(jungsung!.letter, "\u{1169}", "Jungsung should be \u{1169}")
        XCTAssertEqual(jungsung!.remove(), "ㅗ", "removed character should be ㅗ")
        XCTAssertEqual(jungsung!.rawString, "", "Jungsung should be \"\"")
        XCTAssertEqual(jungsung!.letter, "", "Jungsung should be \"\"")
    }
    func testJungsung_RemoveAll() {
        jungsung!.add("ㅗ")
        jungsung!.add("ㅏ")
        jungsung!.add("ㅣ")
        XCTAssertEqual(jungsung!.rawString, "ㅗㅏㅣ", "Jungsung should be ㅗㅏㅣ")
        XCTAssertEqual(jungsung!.letter, "\u{116B}", "Jungsung should be \u{116B}")
        jungsung!.removeAll()
        XCTAssertEqual(jungsung!.rawString, "", "Jungsung should be \"\"")
        XCTAssertEqual(jungsung!.letter, "", "Jungsung should be \"\"")
    }
    
    // Jongsung
    func testJongsung_Validity_OneJaum() {
        jongsung!.add("ㄹ")
        XCTAssertEqual(jongsung!.rawString, "ㄹ", "Jongsung should be ㄹ")
    }
    func testJongsung_Validity_TwoJaums() {
        jongsung!.add("ㄹ")
        jongsung!.add("ㄱ")
        XCTAssertEqual(jongsung!.rawString, "ㄹㄱ", "Jongsung should be ㄹㄱ")
    }
    func testJongsung_Validity_ThreeJaums1() {
        jongsung!.add("ㄹ")
        jongsung!.add("ㄱ")
        jongsung!.add("ㄱ")
        XCTAssertEqual(jongsung!.rawString, "ㄹㄱ", "Jongsung should be ㄹㄱ")
    }
    func testJongsung_Validity_ThreeJaums2() {
        jongsung!.add("ㄹ")
        jongsung!.add("ㄹ")
        jongsung!.add("ㄱ")
        XCTAssertEqual(jongsung!.rawString, "ㄹㄱ", "Jongsung should be ㄹㄱ")
    }
    func testJongsung_Validity_ComplexJaum1() {
        jongsung!.add("ㄲ")
        XCTAssertEqual(jongsung!.rawString, "ㄲ", "Jongsung should be ㄲ")
        XCTAssertEqual(jongsung!.letter, "\u{11A9}", "Jongsung should be \u{11A9}")
    }
    func testJongsung_Validity_ComplexJaum2() {
        jongsung!.add("ㅆ")
        XCTAssertEqual(jongsung!.rawString, "ㅆ", "Jongsung should be ㅆ")
        XCTAssertEqual(jongsung!.letter, "\u{11BB}", "Jongsung should be \u{11BB}")
    }
    func testJongsung_Validity_ComplexJaum3() {
        jongsung!.add("ㄹ")
        jongsung!.add("ㅁ")
        XCTAssertEqual(jongsung!.rawString, "ㄹㅁ", "Jongsung should be ㄹㅁ")
        XCTAssertEqual(jongsung!.letter, "\u{11B1}", "Jongsung should be \u{11B1}")
    }
    func testJongsung_Validity_ValidPartners() {
        jongsung!.add("ㄴ")
        jongsung!.add("ㅎ")
        XCTAssertEqual(jongsung!.rawString, "ㄴㅎ", "Jongsung should be ㄴㅎ")
        XCTAssertEqual(jongsung!.letter, "\u{11AD}", "Jongsung should be \u{11AD}")
    }
    func testJongsung_Validity_InvalidPartners() {
        jongsung!.add("ㄱ")
        jongsung!.add("ㄴ")
        XCTAssertEqual(jongsung!.rawString, "ㄱ", "Jongsung should be ㄱ")
    }
    func testJongsung_Validity_Moum() {
        jongsung!.add("ㅏ")
        XCTAssertEqual(jongsung!.rawString, "", "Jongsung should be empty")
    }
    func testJongsung_canAdd_true1() {
        XCTAssertEqual(jongsung!.rawString, "", "Jongsung should be empty")
        XCTAssert(jongsung!.complexifiable, "Jongsung has nothing - it should be complexifiable")
    }
    func testJongsung_canAdd_true2() {
        jongsung!.add("ㄹ")
        XCTAssertEqual(jongsung!.rawString, "ㄹ", "Jongsung should be ㄹ")
        XCTAssert(jongsung!.complexifiable, "Jongsung has ㄹ - it should be complexifiable")
    }
    func testJongsung_canAdd_true3() {
        jongsung!.add("ㄹ")
        jongsung!.add("ㄴ")
        XCTAssertEqual(jongsung!.rawString, "ㄹ", "Jongsung should be ㄹ")
        XCTAssert(jongsung!.complexifiable, "Jongsung has ㄹ - it should be complexifiable")
    }
    func testJongsung_canAdd_true4() {
        jongsung!.add("ㄹ")
        jongsung!.add("ㄴ")
        jongsung!.add("ㄷ")
        XCTAssertEqual(jongsung!.rawString, "ㄹ", "Jongsung should be ㄹ")
        XCTAssert(jongsung!.complexifiable, "Jongsung has ㄹ - it should be complexifiable")
    }
    func testJongsung_canAdd_false1() {
        jongsung!.add("ㄹ")
        jongsung!.add("ㄱ")
        XCTAssertEqual(jongsung!.rawString, "ㄹㄱ", "Jongsung should be ㄹㄱ")
        XCTAssertFalse(jongsung!.complexifiable, "Jongsung has ㄹㄱ - it should not be complexifiable")
    }
    func testJongsung_canAdd_false2() {
        jongsung!.add("ㄹ")
        jongsung!.add("ㄱ")
        jongsung!.add("ㄱ")
        XCTAssertEqual(jongsung!.rawString, "ㄹㄱ", "Jongsung should be ㄹㄱ")
        XCTAssertFalse(jongsung!.complexifiable, "Jongsung has ㄹㄱ - it should not be complexifiable")
    }
    func testJongsung_letter1() {
        jongsung!.add("ㄱ")
        XCTAssertEqual(jongsung!.letter, "\u{11A8}", "Chosung should be \u{11A8}")
    }
    func testJongsung_letter2() {
        jongsung!.add("ㅎ")
        XCTAssertEqual(jongsung!.letter, "\u{11C2}", "Chosung should be \u{11C2}")
    }
    func testJongsung_Remove1() {
        jongsung!.add("ㄹ")
        jongsung!.add("ㅁ")
        XCTAssertEqual(jongsung!.rawString, "ㄹㅁ", "Jongsung should be ㄹㅁ")
        XCTAssertEqual(jongsung!.letter, "\u{11B1}", "Jongsung should be \u{11B1}")
        XCTAssertEqual(jongsung!.remove(), "ㅁ", "removed character should be ㅁ")
        XCTAssertEqual(jongsung!.rawString, "ㄹ", "Jongsung should be ㄹ")
        XCTAssertEqual(jongsung!.letter, "\u{11AF}", "Jongsung should be \u{11AF}")
    }
    func testJongsung_Remove2() {
        jongsung!.add("ㄹ")
        jongsung!.add("ㅁ")
        XCTAssertEqual(jongsung!.rawString, "ㄹㅁ", "Jongsung should be ㄹㅁ")
        XCTAssertEqual(jongsung!.letter, "\u{11B1}", "Jongsung should be \u{11B1}")
        XCTAssertEqual(jongsung!.remove(), "ㅁ", "removed character should be ㅁ")
        XCTAssertEqual(jongsung!.rawString, "ㄹ", "Jongsung should be ㄹ")
        XCTAssertEqual(jongsung!.letter, "\u{11AF}", "Jongsung should be \u{11AF}")
        XCTAssertEqual(jongsung!.remove(), "ㄹ", "removed character should be ㄹ")
        XCTAssertEqual(jongsung!.rawString, "", "Jongsung should be \"\"")
        XCTAssertEqual(jongsung!.letter, "", "Jongsung should be \"\"")
    }
    func testJongsung_Remove3() {
        jongsung!.add("ㄲ")
        XCTAssertEqual(jongsung!.rawString, "ㄲ", "Jongsung should be ㄲ")
        XCTAssertEqual(jongsung!.letter, "\u{11A9}", "Jongsung should be \u{11A9}")
        XCTAssertEqual(jongsung!.remove(), "ㄲ", "removed character should be ㄲ")
        XCTAssertEqual(jongsung!.rawString, "", "Jongsung should be \"\"")
        XCTAssertEqual(jongsung!.letter, "", "Jongsung should be \"\"")
    }
    func testJongsung_RemoveAll() {
        jongsung!.add("ㄹ")
        jongsung!.add("ㅁ")
        XCTAssertEqual(jongsung!.rawString, "ㄹㅁ", "Jongsung should be ㄹㅁ")
        XCTAssertEqual(jongsung!.letter, "\u{11B1}", "Jongsung should be \u{11B1}")
        jongsung!.removeAll()
        XCTAssertEqual(jongsung!.rawString, "", "Jongsung should be \"\"")
        XCTAssertEqual(jongsung!.letter, "", "Jongsung should be \"\"")
    }
}
