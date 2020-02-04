//
//  VerticalCryptogramGenerator.swift
//  VerticalCryptogramGenerator
//
//  Created by Masato TSUTSUMI on 2020/02/03.
//  Copyright © 2020 Masato TSUTSUMI. All rights reserved.
//

import Foundation
import UIKit

class VerticalCryptogramGenerator {
    

    let text: String
    let crypto: String
    let lineLength: Int
    let errorMessage: String = "もう一度トライしてみてね！"
    
    init(text: String, crypto: String, lineLength: Int) {
        if text.count == 0 {
            self.text = "たいへんだけど。かわいいからしかたないよね。いーっぱいあそびまくっていっぱいねてしんどいくらい喧嘩してでも、手をつないで、寝てる。ずーーっとこの繰り返し。"
        } else {
            self.text = text
        }
        
        if crypto.count == 0 {
            self.crypto = "たかしあいしてる"
        } else {
            self.crypto = crypto
        }
        
        self.lineLength = lineLength
    }
    
    func generate() -> String {
        var textArray: [String] = Array(self.text).map { String($0) }
        

        let firstCrypto: String = String(Array(self.crypto).first!)
        let lastCrypto: String = String(Array(self.crypto).last!)
        let middleCrypto: [String] = Array(self.crypto)[(1..<self.crypto.count - 1)].map { String($0) }

        // search the start of message
         let firstIndex: Int = textArray.firstIndex(of: firstCrypto) ?? -1

        if firstIndex == -1 {
            return "見つからなかったよ。\(self.errorMessage)"
        }

        // search change line place
        var cryptoIndex: Int = firstIndex
        var indexList: [Int] = [firstIndex]
        for crypto in middleCrypto {
            let index: Int = Array(textArray[(cryptoIndex...)]).firstIndex(of: crypto) ?? -1
            
            if index == -1 {
                return "見つからなかったよ。\(self.errorMessage)"
            }
            
            if index > lineLength {
                return "文章の文字数が大きすぎるよ。\(self.errorMessage)"
            }
            
            cryptoIndex += index
            indexList.append(cryptoIndex)
        }

        // search the end of message
        var lastIndex: Int = Array(textArray[(cryptoIndex)...]).firstIndex(of: lastCrypto) ?? -1

        if lastIndex == -1 {
            return "見つからなかったよ。\(self.errorMessage)"
        }

        if lastIndex > lineLength {
            return "文章の文字数が大きすぎるよ。\(self.errorMessage)"
        }
        
        lastIndex += cryptoIndex
        indexList.append(lastIndex)

        // change line
        for i in indexList {
            textArray[i] = "\n" + String(textArray[i])
        }

        let cryptedText: String = textArray.joined()

        return cryptedText

        
    }


}
