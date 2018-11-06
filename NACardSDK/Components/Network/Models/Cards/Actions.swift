//
//  Actions.swift
//
//  Created by Anderson Carvalho on 05/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Actions: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kActionsLinkKey: String = "link"
  private let kActionsACTIONKey: String = "ACTION"
  private let kActionsTYPEKey: String = "TYPE"
  private let kActionsTEXTKey: String = "TEXT"

  // MARK: Properties
  public var link: String?
  public var aCTION: String?
  public var tYPE: String?
  public var tEXT: String?

  // MARK: ObjectMapper Initalizers
  /**
   Map a JSON object to this class using ObjectMapper
   - parameter map: A mapping from ObjectMapper
  */
  required public init?( map: Map){

  }

  /**
  Map a JSON object to this class using ObjectMapper
   - parameter map: A mapping from ObjectMapper
  */
  public func mapping(map: Map) {
    link <- map[kActionsLinkKey]
    aCTION <- map[kActionsACTIONKey]
    tYPE <- map[kActionsTYPEKey]
    tEXT <- map[kActionsTEXTKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = link { dictionary[kActionsLinkKey] = value }
    if let value = aCTION { dictionary[kActionsACTIONKey] = value }
    if let value = tYPE { dictionary[kActionsTYPEKey] = value }
    if let value = tEXT { dictionary[kActionsTEXTKey] = value }
    return dictionary
  }

}
