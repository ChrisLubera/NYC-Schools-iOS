//
//  ResponseError.swift
//  NYCSchools
//
//  Created by Chris Lubera on 3/15/23.
//

import Foundation

struct ResponseError: Error, Equatable {
  let type: ErrorCodes
  let message: String
  
  static func == (lhs: ResponseError, rhs: ResponseError) -> Bool {
    if (lhs.type == rhs.type) {
      return true
    }
    return false
  }
}

enum ErrorCodes {
  case noSAT
  case badData
  case fileNotFound
  case unknown
}
