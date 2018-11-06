//
//  Status.swift
//
//  Created by Anderson Carvalho on 05/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Status: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kStatusSuccessKey: String = "success"
  private let kStatusMessageKey: String = "message"

  // MARK: Properties
  public var success: Bool = false
  public var message: String?

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
    success <- map[kStatusSuccessKey]
    message <- map[kStatusMessageKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[kStatusSuccessKey] = success
    if let value = message { dictionary[kStatusMessageKey] = value }
    return dictionary
  }

}
