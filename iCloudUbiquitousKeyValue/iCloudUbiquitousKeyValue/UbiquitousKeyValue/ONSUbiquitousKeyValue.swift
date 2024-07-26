//
//  ONSUbiquitousKeyValue.swift
//  iCloudUbiquitousKeyValue
//
//  Created by Abhinay Maurya on 26/07/24.
//

import Foundation

@propertyWrapper
struct ONSUbiquitousKeyValue {
    var key: String
    private var value: String?
    private let store = NSUbiquitousKeyValueStore.default
    
    init(key: String,
         value: String? = nil) {
        self.key = key
        self.value = value
    }
    
    public var wrappedValue: String? {
        get {
            return self.store.string(forKey: key)
        } set {
            self.store.set(newValue, forKey: key)
            self.store.synchronize()
        }
    }
}
