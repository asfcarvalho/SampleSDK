//
//  Feed.swift
//
//  Created by Anderson Carvalho on 12/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Feed: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kFeedUriKey: String = "uri"
  private let kFeedOptionsKey: String = "options"

  // MARK: Properties
  public var uri: String?
  public var options: [String]?

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
    uri <- map[kFeedUriKey]
    options <- map[kFeedOptionsKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = uri { dictionary[kFeedUriKey] = value }
    if let value = options { dictionary[kFeedOptionsKey] = value }
    return dictionary
  }

}
