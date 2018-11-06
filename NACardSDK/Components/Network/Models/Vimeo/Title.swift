//
//  Title.swift
//
//  Created by Anderson Carvalho on 12/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Title: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kTitleNameKey: String = "name"
  private let kTitleOwnerKey: String = "owner"
  private let kTitlePortraitKey: String = "portrait"

  // MARK: Properties
  public var name: String?
  public var owner: String?
  public var portrait: String?

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
    name <- map[kTitleNameKey]
    owner <- map[kTitleOwnerKey]
    portrait <- map[kTitlePortraitKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[kTitleNameKey] = value }
    if let value = owner { dictionary[kTitleOwnerKey] = value }
    if let value = portrait { dictionary[kTitlePortraitKey] = value }
    return dictionary
  }

}
