//
//  Chosung.swift
//  SinoKoreanKeyboardApp
//
//  Created by Dongyon Kang on 6/8/15.
//  Copyright (c) 2015 Dongyon Kang. All rights reserved.
//

import Foundation

public class Chosung: SinoKoreanLetter {
    override init() {
        super.init()
        letters = [
            "\u{1100}", // ㄱ
            "\u{1101}", // ㄲ
            "\u{1109}", // ㅅ
            "\u{1102}", // ㄴ
            "\u{110C}", // ㅈ
            "\u{1112}", // ㅎ
            "\u{1103}", // ㄷ
            "\u{1104}", // ㄸ
            "\u{1105}", // ㄹ
            "\u{1100}", // ㄱ
            "\u{1106}", // ㅁ
            "\u{1107}", // ㅂ
            "\u{1109}", // ㅅ
            "\u{1110}", // ㅌ
            "\u{1111}", // ㅍ
            "\u{1112}", // ㅎ
            "\u{1106}", // ㅁ
            "\u{1107}", // ㅂ
            "\u{1108}", // ㅃ
            "\u{1109}", // ㅅ
            "\u{1109}", // ㅅ
            "\u{110A}", // ㅆ
            "\u{110B}", // ㅇ
            "\u{110C}", // ㅈ
            "\u{110D}", // ㅉ
            "\u{110E}", // ㅊ
            "\u{110F}", // ㅋ
            "\u{1110}", // ㅌ
            "\u{1111}", // ㅍ
            "\u{1112}"  // ㅎ
        ]
        partnerList = [
            "ㄱ": [ "ㄱ" ],
            "ㄷ": [ "ㄷ" ],
            "ㅂ": [ "ㅂ" ],
            "ㅅ": [ "ㅅ" ],
            "ㅈ": [ "ㅈ" ]
        ]
        maxPartnerNumber = 2
        base = 12593
    }
    override func add(letter: String) -> Bool {
        if SinoKoreanLetter.isMoum(letter) {
            return false
        }
        return super.add(letter)
    }
}
