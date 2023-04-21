//
//  SchoolTests.swift
//  NYCSchoolsTests
//
//  Created by christopher.lubera on 3/15/23.
//

import XCTest
import CoreLocation
@testable import NYCSchools

final class SchoolTests: XCTestCase {
  
  let fakeSchool = School(dbn: "123", school_name: "Fake school with Lat and Lon", primary_address_line_1: "1345 W Madison St", city: "Chicago", zip: "60661", state_code: "IL", latitude: "41.8822", longitude: "-87.6402")
  
  let fakeSchoolNoLatAndLon = School(dbn: "456", school_name: "Fake school with no Lat and Lon", primary_address_line_1: "1345 W Madison St", city: "Chicago", zip: "60661", state_code: "IL", latitude: nil, longitude: nil)
  
  func testReturnSchoolName() throws {
    XCTAssertTrue(fakeSchool.returnSchoolName() == "Fake school with Lat and Lon")
  }
  
  func testReturnCoordinatesWhenSchoolHasCoordinates() throws {
    XCTAssertTrue(fakeSchool.returnCoordinates().latitude == 41.8822)
  }
  
  func testReturnCoordinatesWhenSchoolHasNoCoordinates() throws {
    XCTAssertTrue(fakeSchoolNoLatAndLon.returnCoordinates().latitude == 40.7831)
  }
  
  func testMakeAddress() throws {
    print(fakeSchool.makeAddress())
    XCTAssertTrue(fakeSchool.makeAddress() == "1345 W Madison St, Chicago IL, 60661")
  }
  
  func testReturnDBN() throws {
    XCTAssertTrue(fakeSchool.returnID() == "123")
  }
  
  func testReturnID() throws {
    XCTAssertTrue(fakeSchool.id == "123")
  }
}
