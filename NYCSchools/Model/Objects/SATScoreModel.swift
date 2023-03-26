//
//  SATScoreModel.swift
//  NYCSchools
//
//  Created by Chris Lubera on 3/15/23.
//

import Foundation

struct SATScoreModel: Codable {
  private let dbn : String
  private let school_name : String
  private let num_of_sat_test_takers : String
  private let sat_critical_reading_avg_score : String
  private let sat_math_avg_score : String
  private let sat_writing_avg_score : String
  
  init(dbn: String, school_name: String, num_of_sat_test_takers: String, sat_critical_reading_avg_score: String, sat_math_avg_score: String, sat_writing_avg_score: String) {
    self.dbn = dbn
    self.school_name = school_name
    self.num_of_sat_test_takers = num_of_sat_test_takers
    self.sat_critical_reading_avg_score = sat_critical_reading_avg_score
    self.sat_math_avg_score = sat_math_avg_score
    self.sat_writing_avg_score = sat_writing_avg_score
  }
  
  func returnID() -> String {
    return dbn
  }
  
  func returnMathScore() -> String {
    return self.sat_math_avg_score
  }
  
  func returnReadingScore() -> String {
    return self.sat_critical_reading_avg_score
  }
  
  func returnWritingScore() -> String {
    return sat_writing_avg_score
  }
}

