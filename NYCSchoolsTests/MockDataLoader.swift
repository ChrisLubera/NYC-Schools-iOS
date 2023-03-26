//
//  MockDataLoader.swift
//  NYCSchoolsTests
//
//  Created by Chris Lubera on 3/23/23.
//

import Foundation
import Combine
@testable import NYCSchools

struct MockDataLoader: NetworkProtocol {
  
  private var schoolArray: Array<NYCSchools.School>?
  private var satArray: Array<NYCSchools.SATScoreModel>?
  private var responseError: NYCSchools.ResponseError?
  
  init(schoolArray: Array<NYCSchools.School>?, satArray: Array<NYCSchools.SATScoreModel>?, responseError: NYCSchools.ResponseError?) {
    self.schoolArray = schoolArray
    self.satArray = satArray
    self.responseError = responseError
  }
  
  func getSchools() -> Future<Array<NYCSchools.School>, NYCSchools.ResponseError> {
    // "load" mock schools
    let subject = Future<Array<NYCSchools.School>, NYCSchools.ResponseError> { completion in
      if schoolArray != nil {
        completion(.success(schoolArray ?? []))
      } else {
        completion(.failure(responseError ?? NYCSchools.ResponseError.init(type: .unknown, message: "Unknown error")))
      }
    }
    return subject
  }
  
  func getSATScores() -> Future<Array<NYCSchools.SATScoreModel>, NYCSchools.ResponseError> {
    // "load" mock SAT scores
    let subject = Future<Array<NYCSchools.SATScoreModel>, NYCSchools.ResponseError> { completion in
      if satArray != nil {
        completion(.success(satArray!))
      } else {
        completion(.failure(responseError ?? NYCSchools.ResponseError.init(type: .unknown, message: "Unknown error")))
      }
    }
    return subject
  }
}
