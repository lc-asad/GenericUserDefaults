//
//  UserDefaultsWrapper.swift
//  GenericUserDefaults
//
//  Created by Asad Ullah on 16/01/2023.
//

import Foundation

public protocol AnyOptional {
    /// Returns `true` if `nil`, otherwise `false`.
    var isNil: Bool { get }
}

extension Optional: AnyOptional {
    public var isNil: Bool { self == nil }
}

public extension UserDefault where T: ExpressibleByNilLiteral {
    
    /// Creates a new User Defaults property wrapper for the given key.
    /// - Parameters:
    ///   - key: The key to use with the user defaults store.
    init(key: String, defaultValue:T, _ container: UserDefaults = .standard) {
        self.init(key: key, defaultValue: defaultValue, container: container)
    }
}


@propertyWrapper public struct UserDefault<T: Codable> {
    
    public let key: String
    public let defaultValue: T
    var container: UserDefaults = .standard
    
    public var wrappedValue: T {
        get {
            //return container.object(forKey: key) as? Value ?? defaultValue
            guard let data = container.object(forKey: key) as? Data else {
                // Return defaultValue when no data in UserDefaults
                return defaultValue
            }
            
            // Convert data to the desire data type
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }
        set {
            // Check whether we're dealing with an optional and remove the object if the new value is nil.
            if let optional = newValue as? AnyOptional, optional.isNil {
                container.removeObject(forKey: key)
            } else {
                // Convert newValue to data
                let data = try? JSONEncoder().encode(newValue)
                container.set(data, forKey: key)
            }
        }
    }
    public var projectedValue: Bool {
        return true
    }
}
