//
//  Double.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 27/7/21.
//

import Foundation

extension Double {
    
    func formatted(hasDecimals: Bool = true) -> String {
        NSString(format: hasDecimals ? "%.2f" : "%.0f", self) as String
    }
    
    var delimiter: String {
        
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        
        let groupingSeparator = ","        
        numberFormatter.groupingSeparator = groupingSeparator
        
        return "$\(numberFormatter.string(from: NSNumber(value: self)) ?? "0")"
        
    }
    
}
