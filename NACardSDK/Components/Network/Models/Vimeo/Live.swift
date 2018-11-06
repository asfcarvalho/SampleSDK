//
//  Live.swift
//
//  Created by Anderson Carvalho on 12/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Live: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kLiveStreamingKey: String = "streaming"
  private let kLiveArchivedKey: String = "archived"

  // MARK: Properties
  public var streaming: Bool = false
  public var archived: Bool = false

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
    streaming <- map[kLiveStreamingKey]
    archived <- map[kLiveArchivedKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[kLiveStreamingKey] = streaming
    dictionary[kLiveArchivedKey] = archived
    return dictionary
  }

}
