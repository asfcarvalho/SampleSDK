//
//  Pictures.swift
//
//  Created by Anderson Carvalho on 12/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Pictures: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kPicturesResourceKeyKey: String = "resource_key"
  private let kPicturesActiveKey: String = "active"
  private let kPicturesSizesKey: String = "sizes"
  private let kPicturesTypeKey: String = "type"
  private let kPicturesUriKey: String = "uri"

  // MARK: Properties
  public var resourceKey: String?
  public var active: Bool = false
  public var sizes: [Sizes]?
  public var type: String?
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
    resourceKey <- map[kPicturesResourceKeyKey]
    active <- map[kPicturesActiveKey]
    sizes <- map[kPicturesSizesKey]
    type <- map[kPicturesTypeKey]
    uri <- map[kPicturesUriKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = resourceKey { dictionary[kPicturesResourceKeyKey] = value }
    dictionary[kPicturesActiveKey] = active
    if let value = sizes { dictionary[kPicturesSizesKey] = value.map { $0.dictionaryRepresentation() } }
    if let value = type { dictionary[kPicturesTypeKey] = value }
    if let value = uri { dictionary[kPicturesUriKey] = value }
    return dictionary
  }

}
