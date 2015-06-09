//
//  SinoKoreanLetter.swift
//  SinoKoreanKeyboardApp
//
//  Created by Dongyon Kang on 6/8/15.
//  Copyright (c) 2015 Dongyon Kang. All rights reserved.
//

import Foundation

enum Jaum: String {
    case Giyeok         = "\u{3131}" // ㄱ
    case Ssanggiyeok    = "\u{3132}" // ㄲ
    case Nieun          = "\u{3134}" // ㄴ
    case Digeut         = "\u{3137}" // ㄷ
    case Ssangdigeut    = "\u{3138}" // ㄸ
    case Rieul          = "\u{3139}" // ㄹ
    case Mieum          = "\u{3141}" // ㅁ
    case Bieup          = "\u{3142}" // ㅂ
    case Ssangbieup     = "\u{3143}" // ㅃ
    case Siot           = "\u{3145}" // ㅅ
    case Ssangsiot      = "\u{3146}" // ㅆ
    case Ieung          = "\u{3147}" // ㅇ
    case Jieut          = "\u{3148}" // ㅈ
    case Ssangjieut     = "\u{3149}" // ㅉ
    case Chieut         = "\u{314A}" // ㅊ
    case Kieuk          = "\u{314B}" // ㅋ
    case Tieut          = "\u{314C}" // ㅌ
    case Pieup          = "\u{314D}" // ㅍ
    case Hieut          = "\u{314E}" // ㅎ
    
    static let allValues = [Giyeok, Ssanggiyeok, Nieun, Digeut, Ssangdigeut, Rieul, Mieum, Bieup, Ssangbieup, Siot, Ssangsiot, Ieung, Jieut, Ssangjieut, Chieut, Kieuk, Tieut, Pieup, Hieut]
}
enum Moum: String {
    case A              = "\u{314F}" // ㅏ
    case Ae             = "\u{3150}" // ㅐ
    case Ya             = "\u{3151}" // ㅑ
    case Yae            = "\u{3152}" // ㅒ
    case Eo             = "\u{3153}" // ㅓ
    case E              = "\u{3154}" // ㅔ
    case Yeo            = "\u{3155}" // ㅕ
    case Ye             = "\u{3156}" // ㅖ
    case O              = "\u{3157}" // ㅗ
    case Wa             = "\u{3158}" // ㅘ
    case Wae            = "\u{3159}" // ㅙ
    case Oe             = "\u{315A}" // ㅚ
    case Yo             = "\u{315B}" // ㅛ
    case U              = "\u{315C}" // ㅜ
    case Wo             = "\u{315D}" // ㅝ
    case We             = "\u{315E}" // ㅞ
    case Wi             = "\u{315F}" // ㅟ
    case Yu             = "\u{3160}" // ㅠ
    case Eu             = "\u{3161}" // ㅡ
    case Ui             = "\u{3162}" // ㅢ
    case I              = "\u{3163}" // ㅣ
    
    static let allValues = [A, Ae, Ya, Yae, Eo, E, Yeo, Ye, O, Wa, Wae, Oe, Yo, U, Wo, We, Wi, Yu, Eu, Ui, I]
}

public class SinoKoreanLetter {
    
    var skChar: [String]
    var letters: [String]
    var partnerList: Dictionary<String, [String]>
    var maxPartnerNumber: Int
    var base: Int
    var count: Int {
        get {
            return skChar.count
        }
    }
    var isEmpty: Bool {
        get {
            return skChar.isEmpty
        }
    }
    var complexifiable: Bool {
        get {
            return canAdd("")
        }
    }
    var rawString: String {
        get {
            var morpheme = ""
            for char in skChar {
                morpheme += char
            }
            return morpheme
        }
    }
    var letter: String {
        get {
            if isEmpty {
                return ""
            }
            var i = 0
            var s = skChar[0].unicodeScalars
            var scalar = Int(s[s.startIndex].value)
            var retStr = letters[scalar - base]
            if skChar.count >= 2 {
                i = find(partnerList[skChar[0]]!, skChar[1])! + 1
                if skChar.count == 3 {
                    i++
                }
                retStr = letters[scalar+i - base]
            }
            return retStr
        }
    }
    
    init() {
        skChar = []
        letters = []
        partnerList = [String: [String]]()
        maxPartnerNumber = 0
        base = 0
    }
    init(skChar: [String], letters: [String], partnerList: [String: [String]], maxPartnerNumber: Int, base: Int) {
        self.skChar = skChar
        self.letters = letters
        self.partnerList = [String: [String]]()
        self.maxPartnerNumber = maxPartnerNumber
        self.base = 0
    }
    
    class func isJaum(skChar: SinoKoreanLetter) -> Bool {
        if skChar is Chosung || skChar is Jongsung {
            return true
        }
        return false
    }
    class func isJaum(letter: String) -> Bool {
        for jaum in Jaum.allValues {
            if (jaum.rawValue == letter) {
                return true
            }
        }
        return false
    }
    class func isMoum(skChar: SinoKoreanLetter) -> Bool {
        if skChar is Jungsung {
            return true
        }
        return false
    }
    class func isMoum(letter: String) -> Bool {
        for moum in Moum.allValues {
            if (moum.rawValue == letter) {
                return true
            }
        }
        return false
    }
    
    func add(letter: String) -> Bool {
        // if there's a previously entered character,
        // make sure the new character is compatible with the previous one
        // and can form a single character
        if !canAdd(letter) {
            return false
        }
        skChar.append(letter)
        return true
    }
    func canAdd(letter: String) -> Bool {
        if !isEmpty {
            if skChar.count >= maxPartnerNumber {
                // if already full
                return false
            } else if partnerList[skChar.last!] == nil {
                // if the last letter doesn't allow complex letters
                return false
            } else if letter != "" && !contains(partnerList[skChar.last!]!, letter) {
                // if letter is not in the partner list
                return false
            }
        }
        return true
    }
    func remove() -> String {
        return skChar.removeLast()
    }
    func removeAll() {
        skChar.removeAll(keepCapacity: false)
    }
    func get(i: Int) -> String {
        if i >= 0 && i < count {
            return skChar[i]
        }
        return ""
    }
    func getFirst() -> String {
        return get(0)
    }
    func getLast() -> String {
        return get(count-1)
    }
}
