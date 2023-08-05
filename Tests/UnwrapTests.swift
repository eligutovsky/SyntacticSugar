@testable import SyntacticSugar
import XCTest

final class UnwrapTests: XCTestCase {
    func test_unwrap() throws {
        let uut = Fixture.optionalString

        let result = try unwrap(uut)

        XCTAssertEqual(result, Fixture.string)
    }

    func test_unwrap_throws_when_value_is_nil() {
        let uut: String? = nil

        XCTAssertThrowsError(try unwrap(uut)) { error in
            XCTAssertEqual(error as? SugarError, SugarError.failedToUnwrap(value: nil, expectedType: String.self, function: #function, line: #line))
        }
    }

    func test_unwrap_throws_custom_error_when_value_is_nil() {
        let uut: String? = nil

        XCTAssertThrowsError(try unwrap(uut, error: SugarError.custom("Custom error"))) { error in
            XCTAssertEqual(error as? SugarError, SugarError.custom("Custom error"))
        }
    }

    func test_unwrap_throws_when_value_is_not_expected_type() {
        let uut: Any? = Fixture.int

        XCTAssertNoThrow(try unwrap(uut))
    }
}
