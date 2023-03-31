//
//  Extensions.swift
//  MvvMExample
//
//  Created by Joseph Gayed on 23/03/2023.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    /// Rounds the double to decimal places value
    func formatted(toPlaces places:Int=1) -> String {
        return String(format: "%.\(places)f", self)
    }
}
