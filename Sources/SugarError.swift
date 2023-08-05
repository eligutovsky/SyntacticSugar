//
//  Copyright (c) 2018 Eli Gutovsky
//

import Foundation

/// An error thrown when a value can't be casted to a generic type.
public enum SugarError: LocalizedError {
    /// An error thrown when a value can't be unwrapped to a generic type.
    case failedToUnwrap(value: Any?, expectedType: Any.Type, function: String = #function, line: Int = #line)
    /// An error thrown when a value can't be casted to a generic type.
    case unableCast(value: Any, expectedType: Any.Type, function: String = #function, line: Int = #line)
    /// An custom error thrown when a value can't pass a guard statement.
    case custom(String, function: String = #function, line: Int = #line)

    public var errorDescription: String? {
        switch self {
        case let .failedToUnwrap(value, expectedType, function, line):
            return
                """
                Failed to unwrap the value: \(value ?? "nil")
                with the expected type: \(expectedType)
                at: \(function):\(line)
                """
        case let .unableCast(value, expectedType, function, line):
            return
                """
                Failed to cast the value: \(value)
                to the type: \(expectedType)
                at: \(function):\(line)
                """
        case let .custom(message, function, line):
            return
                """
                \(message)
                at: \(function):\(line)
                """
        }
    }

}

extension SugarError: Equatable {
    public static func == (lhs: SugarError, rhs: SugarError) -> Bool {
        switch (lhs, rhs) {
        case (.failedToUnwrap, .failedToUnwrap):
            return true
        case (.unableCast, .unableCast):
            return true
        case (.custom, .custom):
            return true
        default:
            return false
        }
    }
}
