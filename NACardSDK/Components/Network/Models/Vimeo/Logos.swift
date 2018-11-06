//
//  Logos.swift
//
//  Created by Anderson Carvalho on 12/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Logos: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kLogosVimeoKey: String = "vimeo"
  private let kLogosCustomKey: String = "custom"

  // MARK: Properties
  public var vimeo: Bool = false
  public var custom: Custom?

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
    vimeo <- map[kLogosVimeoKey]
    custom <- map[kLogosCustomKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[kLogosVimeoKey] = vimeo
    if let value = custom { dictionary[kLogosCustomKey] = value.dictionaryRepresentation() }
    return dictionary
  }

}
