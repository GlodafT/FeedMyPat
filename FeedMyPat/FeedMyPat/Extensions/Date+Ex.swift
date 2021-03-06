//
//  Date+Ex.swift
//  FeedMyPat
//
//  Created by Mikita Igonin on 7.04.21.
//

import Foundation

extension Date {
    func toString(with dateFormat: String = "dd.MM.yyyy" ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat

        return dateFormatter.string(from: self)
    }
}
