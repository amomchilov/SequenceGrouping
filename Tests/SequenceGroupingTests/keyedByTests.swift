import XCTest
import SequenceGrouping

final class KeyedByTests: XCTestCase {
	func testUniqueKeys() {
		let d = ["Apple", "Banana", "Cherry"].keyed(by: { $0.first! })
		XCTAssertEqual(d.count, 3)
		XCTAssertEqual(d["A"]!, "Apple")
		XCTAssertEqual(d["B"]!, "Banana")
		XCTAssertEqual(d["C"]!, "Cherry")
		XCTAssertNil(d["D"])
	}
	
	func testEmpty() {
		let d = EmptyCollection<String>().keyed(by: { $0.first! })
		XCTAssertEqual(d.count, 0)
	}
	
	func testNonUniqueKeys() throws {
		throw XCTSkip("""
		TODO: What's the XCTest equivalent to `expectCrashLater()`?

		https://github.com/apple/swift/blob/4d1d8a9de5ebc132a17aee9fc267461facf89bf8/validation-test/stdlib/Dictionary.swift#L1914
		""")
	}
}
