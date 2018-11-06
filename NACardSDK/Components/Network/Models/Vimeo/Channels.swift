//
//  Channels.swift
//
//  Created by Anderson Carvalho on 12/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Channels: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kChannelsUriKey: String = "uri"
  private let kChannelsOptionsKey: String = "options"
  private let kChannelsTotalKey: String = "total"

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
    uri <- map[kChannelsUriKey]
    options <- map[kChannelsOptionsKey]
    total <- map[kChannelsTotalKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = uri { dictionary[kChannelsUriKey] = value }
    if let value = options { dictionary[kChannelsOptionsKey] = value }
    if let value = total { dictionary[kChannelsTotalKey] = value }
    return dictionary
  }

}
