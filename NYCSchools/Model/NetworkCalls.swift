//
//  NetworkCalls.swift
//  NYCSchools
//
//  Created by Chris Lubera on 3/15/23.
//

import Foundation
import Combine

class NetworkCalls {
  
  let networkProtocol: NetworkProtocol
  private var cancellables = Set<AnyCancellable>()
  
  init(networkProtocol: NetworkProtocol) {
    self.networkProtocol = networkProtocol
  }
  
  func loadListOfSchools() -> Future<Array<School>, ResponseError> {
    return networkProtocol.getSchools()
  }
  
  func loadSATScoresForSchool(id: String) -> Future<SATScoreModel, ResponseError> {
    let subject = Future<SATScoreModel, ResponseError> { completion in
      self.networkProtocol.getSATScores()
        .sink(receiveCompletion: { response in
          switch response {
          case .failure(let error):
            completion(.failure(error))
          case .finished:
            break
          }
        }, receiveValue: { value in
          var valueFound = false
          
          for item in value {
            if id == item.returnID() {
              completion(.success(item))
              valueFound = true
              break
            }
          }
          if !valueFound {
            completion(.failure(ResponseError(type: .noSAT, message: "No SAT score found for this school")))
          }
        })
        .store(in: &self.cancellables)
    }
    return subject
  }
}
