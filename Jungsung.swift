//
//  Jungsung.swift
//  SinoKoreanKeyboardApp
//
//  Created by Dongyon Kang on 6/8/15.
//  Copyright (c) 2015 Dongyon Kang. All rights reserved.
//

import Foundation

public class Jungsung: SinoKoreanLetter {
    override init() {
        super.init()
        letters = [
            "\u{1161}", // ㅏ
            "\u{1162}", // ㅐ
            "\u{1163}", // ㅑ
            "\u{1164}", // ㅒ
            "\u{1165}", // ㅓ
            "\u{1166}", // ㅔ
            "\u{1167}", // ㅕ
            "\u{1168}", // ㅖ
            "\u{1169}", // ㅗ
            "\u{116A}", // ㅘ
            "\u{116B}", // ㅙ
            "\u{116C}", // ㅚ
            "\u{116D}", // ㅛ
            "\u{116E}", // ㅜ
            "\u{116F}", // ㅝ
            "\u{1170}", // ㅞ
            "\u{1171}", // ㅟ
            "\u{1172}", // ㅠ
            "\u{1173}", // ㅡ
            "\u{1174}", // ㅢ
            "\u{1175}"  // ㅣ
        ]
        
        partnerList = [
            "ㅏ": [ "ㅣ" ],
            "ㅑ": [ "ㅣ" ],
            "ㅓ": [ "ㅣ" ],
            "ㅕ": [ "ㅣ" ],
            "ㅗ": [ "ㅏ", "ㅐ", "ㅣ" ],
            "ㅘ": [ "ㅣ" ],
            "ㅜ": [ "ㅓ", "ㅔ", "ㅣ" ],
            "ㅝ": [ "ㅣ" ],
            "ㅡ": [ "ㅣ" ]
        ]
        maxPartnerNumber = 3
        base = 12623
    }
    override func add(letter: String) -> Bool {
        if SinoKoreanLetter.isJaum(letter) {
            return false
        }
        return super.add(letter)
    }
}
