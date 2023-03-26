//
//  DetailViewModelTests.swift
//  NYCSchoolsTests
//
//  Created by Chris Lubera on 3/23/23.
//

import XCTest
import CoreLocation
@testable import NYCSchools

final class DetailViewModelTests: XCTestCase {
  
  let school = School(dbn: "1", school_name: "Test", primary_address_line_1: "500 W Madison St", city: "Chicago", zip: "60661", state_code: "IL", latitude: "41.8822", longitude: "-87.6402")
  
  func testReturnSchoolName() throws {
    let detailViewModel = DetailViewModel()
    detailViewModel.setSchool(school: school)
    
    XCTAssertTrue(detailViewModel.schoolName() == "Test")
  }
  
  func testReturnSchoolNameNoSchool() throws {
    let detailViewModel = DetailViewModel()
    
    XCTAssertTrue(detailViewModel.schoolName() == "Error")
  }
  
  func testReturnSchoolAddress() throws {
    let detailViewModel = DetailViewModel()
    detailViewModel.setSchool(school: school)
    
    XCTAssertTrue(detailViewModel.schoolAddress() == "500 W Madison St, Chicago IL, 60661")
  }
  
  func testReturnSchoolAddressNoSchool() throws {
    let detailViewModel = DetailViewModel()
    
    XCTAssertTrue(detailViewModel.schoolAddress() == "Error")
  }
  
  func testReutrnSchoolCoordinates() throws {
    let detailViewModel = DetailViewModel()
    detailViewModel.setSchool(school: school)
    
    XCTAssertTrue(detailViewModel.schoolCoordinates().longitude == -87.6402)
  }
  
  func testReturnSchoolCoordinatesNoSchool() throws {
    let detailViewModel = DetailViewModel()
    
    XCTAssertTrue(detailViewModel.schoolCoordinates().longitude ==  -73.9712)
  }
  
  func testReturnHasSATTrue() throws {
    // TODO: this
    XCTAssertTrue(true == true)
  }
  
  func testReturnHasSATFalse() throws {
    // TODO: this
    XCTAssertTrue(true == true)
  }
  
  func testReturnSATMath() throws {
    // TODO: this
    XCTAssertTrue(true == true)
  }
  
  func testReturnSATMathError() throws {
    let detailViewModel = DetailViewModel()
    
    XCTAssertTrue(detailViewModel.returnSATMath() == "Error")
  }
  
  func testReturnSATReading() throws {
    // TODO: this
    XCTAssertTrue(true == true)
  }
  
  func testReturnSATReadingError() throws {
    let detailViewModel = DetailViewModel()
    
    XCTAssertTrue(detailViewModel.returnSATReading() == "Error")
  }
  
  func testReturnSATWriting() throws {
    // TODO: this
    XCTAssertTrue(true == true)
  }
  
  func testReturnSATWritingError() throws {
    let detailViewModel = DetailViewModel()
    
    XCTAssertTrue(detailViewModel.returnSATWriting() == "Error")
  }
  
  
  
}
