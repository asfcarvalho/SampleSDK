//
//  Videos.swift
//
//  Created by Anderson Carvalho on 12/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Videos: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kVideosPrivacyKey: String = "privacy"

  // MARK: Properties
  public var privacy: String?

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
    privacy <- map[kVideosPrivacyKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = privacy { dictionary[kVideosPrivacyKey] = value }
    return dictionary
  }

}
