//
//  Copyright (c) 2018 Eli Gutovsky
//

/// Return a non-nil generic type or throw an error. 
/// A type will be defined by type inference. Using for simplifying unwrap procedure.
///
/// - Parameter
///   - raw: A generic optional type.
/// - Returns: A generic non-nil type
/// - Throws: A `CastError` if the value is nil.
public func unwrap<T>(_ raw: T?, _ function: String = #function, _ line: Int = #line) throws -> T {
    return try unwrap(raw, error: nil, function, line)
}

/// Return a non-nil generic type or throw an error. 
/// A type will be defined by type inference. Using for simplifying unwrap procedure.
///
/// - Parameter
///   - raw: A generic optional type.
///   - error: An error that will be throw instead of `Error`
/// - Returns: A generic non-nil type
/// - Throws: A `CastError` if the value is nil or can't be casted to the generic type.
public func unwrap<T>(_ raw: T?, error: Error?, _ function: String = #function, _ line: Int = #line) throws -> T {
    guard let unwrapped = raw else {
        throw error ?? SugarError.failedToUnwrap(value: raw, expectedType: T.self, function: function, line: line)
    }
    return unwrapped
}
