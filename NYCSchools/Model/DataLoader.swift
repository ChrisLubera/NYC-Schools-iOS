//
//  DataLoader.swift
//  NYCSchools
//
//  Created by Chris Lubera on 3/23/23.
//

import Foundation
import Combine

struct DataLoader: NetworkProtocol {
  func getSchools() -> Future<Array<School>, ResponseError> {
    let subject = Future<Array<School>, ResponseError> { completion in
      if let path = Bundle.main.path(forResource: "NYCSchools", ofType: "json") {
        do {
          let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
          let decoder = JSONDecoder()
          let result = try decoder.decode([School].self, from: data)
          completion(.success(result))
        } catch {
          completion(.failure(ResponseError(type: .badData, message: "Error loading list of schools")))
        }
      } else {
        completion(.failure(ResponseError(type: .fileNotFound, message: "List of schools not found")))
      }
    }
    return subject
  }
  
  func getSATScores() -> Future<Array<SATScoreModel>, ResponseError> {
    let subject = Future<Array<SATScoreModel>, ResponseError> { completion in
      if let path = Bundle.main.path(forResource: "SATScores", ofType: "json") {
        do {
          let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
          let decoder = JSONDecoder()
          let result = try decoder.decode([SATScoreModel].self, from: data)
          completion(.success(result))
        } catch {
          completion(.failure(ResponseError(type: .badData, message: "Error loading SAT scores")))
        }
      } else {
        completion(.failure(ResponseError(type: .fileNotFound, message: "SAT scores file not found")))
      }
    }
    return subject
  }
}
