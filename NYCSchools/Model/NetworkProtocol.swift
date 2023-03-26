//
//  NetworkProtocol.swift
//  NYCSchools
//
//  Created by Chris Lubera on 3/23/23.
//

import Foundation
import Combine

protocol NetworkProtocol {
  func getSchools() -> Future<Array<School>, ResponseError>
  func getSATScores() -> Future<Array<SATScoreModel>, ResponseError>
  
}
