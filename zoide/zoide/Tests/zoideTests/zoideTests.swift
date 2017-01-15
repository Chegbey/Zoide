import XCTest
@testable import zoide

class zoideTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(zoide().text, "Hello, World!")
    }


    static var allTests : [(String, (zoideTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
