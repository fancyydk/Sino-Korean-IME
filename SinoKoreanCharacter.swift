//
//  SinoKoreanCharacter.swift
//  SinoKoreanKeyboardApp
//
//  Created by Dongyon Kang on 12/2/14.
//  Copyright (c) 2014 Dongyon Kang. All rights reserved.
//

import Foundation

enum SKState {
    case CHOSUNG_ONLY
    case CHOSUNG_JUNGSUNG
    case JUNGSUNG_ONLY
    case JUNGSUNG_JONGSUNG
    case JONGSUNG_ONLY
    case COMPLETE
}

public class SinoKoreanCharacter {
    var chosung: Chosung?
    var jungsung: Jungsung?
    var jongsung: Jongsung?
    var state: SKState {
        get {
            if chosung!.isEmpty {
                if jungsung!.isEmpty {
                    return SKState.CHOSUNG_JUNGSUNG
                } else if jungsung!.complexifiable {
                    return SKState.JUNGSUNG_ONLY
                } else {
                    return SKState.COMPLETE
                }
            } else if chosung!.complexifiable {
                if jungsung!.isEmpty {
                    return SKState.CHOSUNG_JUNGSUNG
                } else if jongsung!.isEmpty && jungsung!.complexifiable {
                    return SKState.JUNGSUNG_JONGSUNG
                } else if jongsung!.complexifiable {
                    return SKState.JONGSUNG_ONLY
                } else {
                    return SKState.COMPLETE
                }
            } else {
                if jungsung!.isEmpty {
                    return SKState.JUNGSUNG_ONLY
                } else if jongsung!.isEmpty && jungsung!.complexifiable {
                    return SKState.JUNGSUNG_JONGSUNG
                } else if jongsung!.complexifiable {
                    return SKState.JONGSUNG_ONLY
                } else {
                    return SKState.COMPLETE
                }
            }
        }
    }
    var rawString: String {
        get {
            return chosung!.rawString + jungsung!.rawString + jongsung!.rawString
        }
    }
    var actualString: String {
        get {
            return chosung!.letter + jungsung!.letter + jongsung!.letter
        }
    }
    var isEmpty: Bool {
        get {
            return chosung!.isEmpty && jungsung!.isEmpty && jongsung!.isEmpty
        }
    }
    var length: Int {
        get {
            return chosung!.count + jungsung!.count + jongsung!.count
        }
    }
    
    init() {
        chosung = Chosung()
        jungsung = Jungsung()
        jongsung = Jongsung()
    }
    
    func isJaum(letter: String) -> Bool {
        return SinoKoreanLetter.isJaum(letter)
    }
    func isMoum(letter: String) -> Bool {
        return SinoKoreanLetter.isMoum(letter)
    }
    
    func add(letter: String) -> String {
        var isAdded: Bool
        var result = ""
        
        switch state {
        case SKState.CHOSUNG_ONLY:
            isAdded = chosung!.add(letter)
        case SKState.CHOSUNG_JUNGSUNG:
            if isJaum(letter) {
                isAdded = chosung!.add(letter)
            } else {
                isAdded = jungsung!.add(letter)
            }
        case SKState.JUNGSUNG_ONLY:
            isAdded = jungsung!.add(letter)
        case SKState.JUNGSUNG_JONGSUNG:
            if isMoum(letter) {
                isAdded = jungsung!.add(letter)
            } else {
                isAdded = jongsung!.add(letter)
            }
        case SKState.JONGSUNG_ONLY:
            isAdded = jongsung!.add(letter)
        case SKState.COMPLETE:
            isAdded = false
        default:
            isAdded = false
        }
        
        if !isAdded {
            var shouldCarryOver = canTakeLastLetter(letter)
            var lastLetter: String?
            if shouldCarryOver {
                lastLetter = jongsung!.remove()
            }
            result = actualString
            self.removeAll()
            if shouldCarryOver && (lastLetter != nil) {
                add(lastLetter!)
            }
            add(letter)
        }
        return result
    }
    func remove() -> String {
        var retVal = ""
        if !jongsung!.isEmpty {
            retVal = jongsung!.remove()
        } else if !jungsung!.isEmpty {
            retVal = jungsung!.remove()
        } else if !chosung!.isEmpty {
            retVal = chosung!.remove()
        }
        return retVal
    }
    func removeAll() {
        chosung!.removeAll()
        jungsung!.removeAll()
        jongsung!.removeAll()
    }
    func canTakeLastLetter(letter: String) -> Bool {
        if isMoum(letter) &&
           (state == SKState.JONGSUNG_ONLY ||
            state == SKState.COMPLETE) {
                return true
        }
        return false
    }
}
