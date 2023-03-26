//
//  NetworkCallsTests.swift
//  NYCSchoolsTests
//
//  Created by Chris Lubera on 3/23/23.
//

import XCTest
import CoreLocation
import Combine
@testable import NYCSchools

final class NetworkCallsTests: XCTestCase {
  
  let schoolArray = [School(dbn: "123", school_name: "Fake school with Lat and Lon", primary_address_line_1: "500 W Madison St", city: "Chicago", zip: "60661", state_code: "IL", latitude: "41.8822", longitude: "-87.6402")]
  
  let SATArray = [SATScoreModel(dbn: "1", school_name: "School", num_of_sat_test_takers: "4", sat_critical_reading_avg_score: "400", sat_math_avg_score: "400", sat_writing_avg_score: "400")]
  
  private var cancellables = Set<AnyCancellable>()
  
  func testLoadListOfSchoolsReturnsSchoolList() throws {
    let networkCalls = NetworkCalls(networkProtocol: MockDataLoader(schoolArray: schoolArray, satArray: nil, responseError: nil))
    
    networkCalls.loadListOfSchools()
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          XCTFail("Should not return an error: \(error.message)")
        case .finished:
          break
        }
      }, receiveValue: { value in
        // the schools must be equal
        
        
      }).store(in: &cancellables)
  }
  
  func testLoadListOfSchoolsReturnsBadDataError() throws {
    let networkCalls = NetworkCalls(networkProtocol: MockDataLoader(schoolArray: nil, satArray: nil, responseError: ResponseError(type: .badData, message: "")))
    
    networkCalls.loadListOfSchools()
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          XCTAssertTrue(error == ResponseError(type: .badData, message: ""))
        case .finished:
          break
        }
      }, receiveValue: { value in
        XCTFail("Should not recive a value")
      }).store(in: &cancellables)
  }
  
  func testLoadListOfSchoolsReturnsFileNotFoundError() throws {
    let networkCalls = NetworkCalls(networkProtocol: MockDataLoader(schoolArray: nil, satArray: nil, responseError: ResponseError(type: .fileNotFound, message: "")))
    
    networkCalls.loadListOfSchools()
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          XCTAssertTrue(error == ResponseError(type: .fileNotFound, message: ""))
        case .finished:
          break
        }
      }, receiveValue: { value in
        XCTFail("Should not recive a value")
      }).store(in: &cancellables)
  }
  
  func testLoadSATScoresforSchoolFindsSATScore() throws {
    let networkCalls = NetworkCalls(networkProtocol: MockDataLoader(schoolArray: nil, satArray: SATArray, responseError: nil))
    
    networkCalls.loadSATScoresForSchool(id: "1")
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          XCTFail("Should not return an error: \(error.message)")
        case .finished:
          break
        }
      }, receiveValue: { value in
        // find item in array
      }).store(in: &cancellables)
  }
  
  func testLoadSATScoresforSchoolDoesNotFindSATScore() throws {
    let networkCalls = NetworkCalls(networkProtocol: MockDataLoader(schoolArray: nil, satArray: SATArray, responseError: nil))
    
    networkCalls.loadSATScoresForSchool(id: "1")
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          XCTFail("Should not return an error: \(error.message)")
        case .finished:
          break
        }
      }, receiveValue: { value in
        // do not find item in array
      }).store(in: &cancellables)
  }
  
  func testLoadSATScoresforSchoolReturnsBadDataError() throws {
    let networkCalls = NetworkCalls(networkProtocol: MockDataLoader(schoolArray: nil, satArray: nil, responseError: ResponseError(type: .badData, message: "")))
    
    networkCalls.loadSATScoresForSchool(id: "")
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          XCTAssertTrue(error == ResponseError(type: .badData, message: ""))
        case .finished:
          break
        }
      }, receiveValue: { value in
        XCTFail("Should not recive a value")
      }).store(in: &cancellables)
  }
  
  func testLoadSATScoresforSchoolReturnsFileNotFound() throws {
    let networkCalls = NetworkCalls(networkProtocol: MockDataLoader(schoolArray: nil, satArray: nil, responseError: ResponseError(type: .fileNotFound, message: "")))
    
    networkCalls.loadSATScoresForSchool(id: "")
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          XCTAssertTrue(error == ResponseError(type: .fileNotFound, message: ""))
        case .finished:
          break
        }
      }, receiveValue: { value in
        XCTFail("Should not recive a value")
      }).store(in: &cancellables)
  }
}
