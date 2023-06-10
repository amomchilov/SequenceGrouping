import XCTest
import SequenceGrouping

final class GroupedByTests: XCTestCase {
	// Based on https://github.com/apple/swift/blob/4d1d8a9de5ebc132a17aee9fc267461facf89bf8/validation-test/stdlib/Dictionary.swift#L1974-L1988
	
	func testGroupedBy() {
		let r = 0..<10

		let d1 = r.grouped(by: { $0 % 3 })
		XCTAssertEqual(3, d1.count)
		XCTAssertEqual(d1[0]!, [0, 3, 6, 9])
		XCTAssertEqual(d1[1]!, [1, 4, 7])
		XCTAssertEqual(d1[2]!, [2, 5, 8])

		let d2 = r.grouped(by: { $0 })
		XCTAssertEqual(10, d2.count)

		let d3 = (0..<0).grouped(by: { $0 })
		XCTAssertEqual(0, d3.count)
	}
}