//
//  Referrer.swift
//  monetate-ios-sdk
//
//  Created by Umar Sayyed on 26/10/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation

/** This is the referring URL of the visitor.  */

public struct Referrer: Codable, Context {
    
    public func isContextSwitched(ctx: Context) -> Bool {
        if let val = ctx as? Referrer, val.referrer != self.referrer {
            return true
        }
        return false
    }
    
    /** A value which identifies the type of event. */
    public let eventType: String
    /** The referring URL */
    public var referrer: String
    
    public init(referrer: String) {
        eventType = "monetate:context:Referrer"
        self.referrer = referrer
    }
}

