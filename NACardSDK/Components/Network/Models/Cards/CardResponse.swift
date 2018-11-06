//
//  CardResponse.swift
//
//  Created by Anderson Carvalho on 05/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class CardResponse: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kCardResponseStatusKey: String = "status"
  private let kCardResponseResponseKey: String = "response"

  // MARK: Properties
  public var status: Status?
  public var response: [Card]?

  // MARK: ObjectMapper Initalizers
  /**
   Map a JSON object to this class using ObjectMapper
   - parameter map: A mapping from ObjectMapper
  */
  required public init?(map: Map){

  }

  /**
  Map a JSON object to this class using ObjectMapper
   - parameter map: A mapping from ObjectMapper
  */
  public func mapping(map: Map) {
    status <- map[kCardResponseStatusKey]
    response <- map[kCardResponseResponseKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = status { dictionary[kCardResponseStatusKey] = value.dictionaryRepresentation() }
    if let value = response { dictionary[kCardResponseResponseKey] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
