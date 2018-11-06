//
//  Watchlater.swift
//
//  Created by Anderson Carvalho on 12/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Watchlater: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kWatchlaterUriKey: String = "uri"
  private let kWatchlaterOptionsKey: String = "options"
  private let kWatchlaterTotalKey: String = "total"

  // MARK: Properties
  public var uri: String?
  public var options: [String]?
  public var total: Int?

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
    uri <- map[kWatchlaterUriKey]
    options <- map[kWatchlaterOptionsKey]
    total <- map[kWatchlaterTotalKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = uri { dictionary[kWatchlaterUriKey] = value }
    if let value = options { dictionary[kWatchlaterOptionsKey] = value }
    if let value = total { dictionary[kWatchlaterTotalKey] = value }
    return dictionary
  }

}
