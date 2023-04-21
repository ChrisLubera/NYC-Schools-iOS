//
//  ListViewModel.swift
//  NYCSchools
//
//  Created by Chris Lubera on 3/15/23.
//

import Foundation
import Combine

class ListViewModel {
  
  private let networkCalls = NetworkCalls(networkProtocol: DataLoader())
  private var cancellables = Set<AnyCancellable>()
  
  func listOfSchools() -> Array<School> {
    var listOfSchools: Array<School>  = []
    networkCalls.loadListOfSchools()
      .sink { completion in
        switch completion {
        case .failure(let error):
          print(error.message)
        case .finished:
          break
        }
      } receiveValue: { value in
        listOfSchools = value
      }
      .store(in: &cancellables)
    
    return listOfSchools
  }
  
}
