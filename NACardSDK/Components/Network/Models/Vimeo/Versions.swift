//
//  Versions.swift
//
//  Created by Anderson Carvalho on 12/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Versions: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kVersionsOptionsKey: String = "options"
  private let kVersionsTotalKey: String = "total"
  private let kVersionsCurrentUriKey: String = "current_uri"
  private let kVersionsUriKey: String = "uri"

  // MARK: Properties
  public var options: [String]?
  public var total: Int?
  public var currentUri: String?
  public var uri: String?

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
    options <- map[kVersionsOptionsKey]
    total <- map[kVersionsTotalKey]
    currentUri <- map[kVersionsCurrentUriKey]
    uri <- map[kVersionsUriKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = options { dictionary[kVersionsOptionsKey] = value }
    if let value = total { dictionary[kVersionsTotalKey] = value }
    if let value = currentUri { dictionary[kVersionsCurrentUriKey] = value }
    if let value = uri { dictionary[kVersionsUriKey] = value }
    return dictionary
  }

}
