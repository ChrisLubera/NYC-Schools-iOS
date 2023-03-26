//
//  SATScoreModelTests.swift
//  NYCSchoolsTests
//
//  Created by Chris Lubera on 3/23/23.
//

import XCTest
import CoreLocation
@testable import NYCSchools

final class SATScoreModelTests: XCTestCase {
  
  // We took the ACT here in Chicago, we're gonna give them ACT numbers instead for fun
  let scoreModel = SATScoreModel(dbn: "123", school_name: "Hogwarts School of Witchcraft and Wizardry", num_of_sat_test_takers: "1", sat_critical_reading_avg_score: "36", sat_math_avg_score: "35", sat_writing_avg_score: "34")
  
  func testReturnID() throws {
    XCTAssertTrue(scoreModel.returnID() == "123")
  }
  
  func testReturnMath() throws {
    XCTAssertTrue(scoreModel.returnMathScore() == "35")
  }
  
  func testReturnReading() throws {
    XCTAssertTrue(scoreModel.returnReadingScore() == "36")
  }
  
  func testReturnWriting() throws {
    XCTAssertTrue(scoreModel.returnWritingScore() == "34")
  }
}
