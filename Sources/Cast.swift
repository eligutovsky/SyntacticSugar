//
//  Copyright (c) 2018 Eli Gutovsky
//

/// Return a non-nil generic type or throw an error. A type will be defined by type inference.
///
/// - Parameter
///     - raw: Any optional type.
///     - error: Optional. An error that will be throw instead of `Error`
/// - Returns: A generic non-nil type.
/// - Throws: A `CastError` if the value is nil or can't be casted to the generic type.
public func cast<T>(_ raw: Any?, error: Error? = nil, _ function: String = #function, _ line: Int = #line) throws -> T {
    let unwrapped = try unwrap(raw, error: error)
    guard let value = unwrapped as? T else {
        throw error ?? SugarError.unableCast(value: unwrapped, expectedType: T.self, function: function, line: line)
    }
    return value
}
