//
//  String+DateFormatter.swift
//  
//
//  Created by Ozcan Akkoca on 20.01.2024.
//

import Foundation

extension String {
 
    public func parseDate(withFormat format: String = "yyyy-MM-dd'T'HH:mm:ssz", wantedFormat: String = "dd.MMMM.yyyy hh:mm", timeZone: TimeZone = .autoupdatingCurrent) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = timeZone
        dateFormatter.locale = Locale(identifier: "tr_TR")
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = wantedFormat
            let newDateString = dateFormatter.string(from: date)
            return newDateString
        }
        
        return nil
    }
    
    public func toDate(withFormat format: String = "yyyy-MM-dd'T'HH:mm:ssz", timeZone: TimeZone = .autoupdatingCurrent) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = timeZone
        dateFormatter.locale = Locale(identifier: "tr_TR")
        
        return dateFormatter.date(from: self)
    }
}

