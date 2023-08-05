@testable import SyntacticSugar
import XCTest

final class CastTests: XCTestCase {
    func test_cast() throws {
        let uut = Fixture.optionalString

        let result: String = try cast(uut)

        XCTAssertEqual(result, Fixture.string)
    }

    func test_cast_throws_when_value_is_nil() {
        let uut: String? = nil

        func execute() throws {
            let _: String = try cast(uut)
        }

        XCTAssertThrowsError(try execute()) { error in
            XCTAssertEqual(
                error as? SugarError,
                SugarError.failedToUnwrap(value: nil, expectedType: String.self)
            )
        }
    }

    func test_cast_throws_custom_error_when_value_is_nil() {
        let uut: String? = nil

        func execute() throws {
            let _: String = try cast(uut, error: SugarError.custom("Custom error"))
        }

        XCTAssertThrowsError(try execute()) { error in
            XCTAssertEqual(error as? SugarError, SugarError.custom("Custom error"))
        }
    }
}
