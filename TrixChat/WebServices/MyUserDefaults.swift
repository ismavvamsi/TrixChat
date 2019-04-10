//
//  MyUserDefaults.swift
//  Stay Ahead
//
//  Created by Kishore on 9/20/16.
//  Copyright © 2016 IDS Next. All rights reserved.
//

import Foundation

class MyUserDefaults {
    
    fileprivate let defaults: UserDefaults
    
    init() {
        defaults = UserDefaults.standard
    }
    /**
     get the user defaults store based on key, if not found returns nil
     - Parameters:
     - String: key
     - Returns: optional String
     */
    func get (_ key: String) -> String? {
        if let value = defaults.string(forKey: key) {
            return value
        }
        return nil
    }
    
    /**
     set the user defaults
     - Parameters:
     - String: key
     - String: value
     */
    func set (_ key: String, value: String) {
        defaults.set(value, forKey: key)
    }
    
//    func setPushData (_ key: PushData, value: PushData) {
//        defaults.set(value, forKey: key)
//    }
    /**
     get the user defaults store based on key, if not found returns false
     - Parameters:
     - String: key
     - Returns: Bool
     */
    func getBoolean (_ key: String) -> Bool {
        var status = false
        status = defaults.bool(forKey: key)
        return status
    }
    
    /**
     set the user defaults in boolean
     - Parameters:
     - String: key
     - Bool: value
     */
    func setBoolean (_ key: String, value: Bool) {
        defaults.set(value, forKey: key)
    }
    
    /**
     remove a user default base on key
     - Parameters: key
     */
    func remove (_ key: String) {
        defaults.removeObject(forKey: key)
    }
}
