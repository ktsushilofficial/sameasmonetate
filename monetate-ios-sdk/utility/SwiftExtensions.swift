//
//  SwiftExtensions.swift
//  monetate-ios-sdk
//
//  Created by Umar Sayyed on 14/09/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation


extension Date {
    func toString (_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    func toUTCString (_ format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        return dateFormatter.string(from: self)
    }
    
    static func toDate (date: String, format: String)  -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: date)
    }
}

extension String {
    func toDate (format: String)  -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
}


extension Data {
    func toJSON () -> [String: Any]?{
        do {
            return try JSONSerialization.jsonObject(with: self, options: []) as? [String: Any]
        } catch {
           
            Log.error("Data \(error.localizedDescription)")
        }
        return nil
    }
    var hexString: String {
        let hexString = map { String(format: "%02.2hhx", $0) }.joined()
        return hexString
    }
    
    var toString: String {
        return String(decoding: self, as: UTF8.self)
    }
    var toString1: String? {
        return String(data: self, encoding: .utf8)
    }
    
    
}

public extension Dictionary {
    var toString: String? {
        guard let theJSONData = try? JSONSerialization.data(withJSONObject: self,
                                                            options: [.prettyPrinted]) else { return nil }
        
        return String(data: theJSONData, encoding: .utf8)
    }
    var toData: Data? {
        guard let data = try? JSONSerialization.data(withJSONObject: self,
                                                     options: [.prettyPrinted]) else { return nil }
        
        return data
    }
}

extension Dictionary {
    var toString1: String! {
        guard let theJSONData = try? JSONSerialization.data(withJSONObject: self,
                                                            options: [.prettyPrinted]) else { return "" }
        
        return String(data: theJSONData, encoding: .utf8)
    }
}


extension Array {
    var toData: Data? {
        guard let data = try? JSONSerialization.data(withJSONObject: self) else { return nil }
        return data
    }
}


extension NSArray {
    var toData: Data? {
        guard let data = try? JSONSerialization.data(withJSONObject: self) else { return nil }
        return data
    }
}
