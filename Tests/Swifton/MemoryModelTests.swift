@testable import Swifton
import XCTest

class MemoryModelTests: XCTestCase {

    var record: TestModel!

    static var allTests: [(String, MemoryModelTests -> () throws -> Void)] {
        return [
            ("testAddRecordToCollection", testAddRecordToCollection),
            ("testFindRecordByStringId", testFindRecordByStringId),
            ("testFindRecordByIntId", testFindRecordByIntId),
            ("testAccessRecordsAttributeViaSubscript", testAccessRecordsAttributeViaSubscript),
            ("testUpdateRecord", testUpdateRecord),
            ("testDestroyRecord", testDestroyRecord)
        ]
    }

    override func setUp() {
        TestModel.all = [MemoryModel]()
        record = TestModel.create(attributes: ["name": "Saulius", "surname": "Grigaitis"])
    }

    func testAddRecordToCollection() {
        XCTAssertEqual(TestModel.all, [record])
    }

    func testFindRecordByStringId() {
        let expected = TestModel.find(id: String(record.id))
        XCTAssertEqual(record, expected)
    }

    func testFindRecordByIntId() {
        let expected = TestModel.find(id: record.id)
        XCTAssertEqual(record, expected)
    }

    func testAccessRecordsAttributeViaSubscript() {
        XCTAssertEqual(String(record["name"]!), "Saulius")
        XCTAssertEqual(String(record["surname"]!), "Grigaitis")
    }

    func testUpdateRecord() {
        record.update(attributes: ["name": "James", "surname": "Bond"])
        XCTAssertEqual(String(record["name"]!), "James")
        XCTAssertEqual(String(record["surname"]!), "Bond")
    }

    func testDestroyRecord() {
        TestModel.destroy(model: record)
        XCTAssertEqual(TestModel.all.count, 0)
    }

}
