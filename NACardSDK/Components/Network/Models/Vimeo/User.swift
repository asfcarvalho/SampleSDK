//
//  User.swift
//
//  Created by Anderson Carvalho on 12/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class User: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kUserMetadataKey: String = "metadata"
  private let kUserNameKey: String = "name"
  private let kUserResourceKeyKey: String = "resource_key"
  private let kUserUriKey: String = "uri"
  private let kUserWebsitesKey: String = "websites"
  private let kUserCreatedTimeKey: String = "created_time"
  private let kUserLinkKey: String = "link"
  private let kUserPreferencesKey: String = "preferences"
  private let kUserAccountKey: String = "account"
  private let kUserContentFilterKey: String = "content_filter"

  // MARK: Properties
  public var metadata: Metadata?
  public var name: String?
  public var resourceKey: String?
  public var uri: String?
  public var websites: [Any]?
  public var createdTime: String?
  public var link: String?
  public var preferences: Preferences?
  public var account: String?
  public var contentFilter: [String]?

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
    metadata <- map[kUserMetadataKey]
    name <- map[kUserNameKey]
    resourceKey <- map[kUserResourceKeyKey]
    uri <- map[kUserUriKey]
    websites <- map[kUserWebsitesKey]
    createdTime <- map[kUserCreatedTimeKey]
    link <- map[kUserLinkKey]
    preferences <- map[kUserPreferencesKey]
    account <- map[kUserAccountKey]
    contentFilter <- map[kUserContentFilterKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = metadata { dictionary[kUserMetadataKey] = value.dictionaryRepresentation() }
    if let value = name { dictionary[kUserNameKey] = value }
    if let value = resourceKey { dictionary[kUserResourceKeyKey] = value }
    if let value = uri { dictionary[kUserUriKey] = value }
    if let value = websites { dictionary[kUserWebsitesKey] = value }
    if let value = createdTime { dictionary[kUserCreatedTimeKey] = value }
    if let value = link { dictionary[kUserLinkKey] = value }
    if let value = preferences { dictionary[kUserPreferencesKey] = value.dictionaryRepresentation() }
    if let value = account { dictionary[kUserAccountKey] = value }
    if let value = contentFilter { dictionary[kUserContentFilterKey] = value }
    return dictionary
  }

}
