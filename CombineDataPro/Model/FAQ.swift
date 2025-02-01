//
//  FAQ.swift
//  CombineDataPro
//
//  Created by Sothesom on 13/11/1403.
//

import Foundation

// داده های جیسون رو دریافت کنه و بعدش رمز گشایی کنه
struct FAQ: Identifiable, Decodable {
    var id: Int
    var question: String
    var answer: String
}
