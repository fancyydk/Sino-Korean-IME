//
//  Jongsung.swift
//  SinoKoreanKeyboardApp
//
//  Created by Dongyon Kang on 6/8/15.
//  Copyright (c) 2015 Dongyon Kang. All rights reserved.
//

import Foundation

public class Jongsung: SinoKoreanLetter {
    override init() {
        super.init()
        letters = [
            "\u{11A8}", // ㄱ
            "\u{11A9}", // ㄲ
            "\u{11AA}", // ㄱㅅ
            "\u{11AB}", // ㄴ
            "\u{11AC}", // ㄴㅈ
            "\u{11AD}", // ㄴㅎ
            "\u{11AE}", // ㄷ
            "\u{11AE}", // ㄷ, placeholder for ㄸ
            "\u{11AF}", // ㄹ
            "\u{11B0}", // ㄹㄱ
            "\u{11B1}", // ㄹㅁ
            "\u{11B2}", // ㄹㅂ
            "\u{11B3}", // ㄹㅅ
            "\u{11B4}", // ㄹㅌ
            "\u{11B5}", // ㄹㅍ
            "\u{11B6}", // ㄹㅎ
            "\u{11B7}", // ㅁ
            "\u{11B8}", // ㅂ
            "\u{11B8}", // ㅂ, placeholder for ㅃ
            "\u{11B9}", // ㅂㅅ
            "\u{11BA}", // ㅅ
            "\u{11BB}", // ㅆ
            "\u{11BC}", // ㅇ
            "\u{11BD}", // ㅈ
            "\u{11BD}", // ㅈ, placeholder for ㅉ
            "\u{11BE}", // ㅊ
            "\u{11BF}", // ㅋ
            "\u{11C0}", // ㅌ
            "\u{11C1}", // ㅍ
            "\u{11C2}"  // ㅎ
        ]
        partnerList = [
            "ㄱ": [ "ㄱ", "ㅅ" ],
            "ㄴ": [ "ㅈ", "ㅎ" ],
            "ㄹ": [ "ㄱ", "ㅁ", "ㅂ", "ㅅ", "ㅌ", "ㅍ", "ㅎ" ],
            "ㅂ": [ "ㅅ" ],
            "ㅅ": [ "ㅅ" ]
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
