//
//  Privacy.swift
//
//  Created by Anderson Carvalho on 12/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Privacy: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kPrivacyEmbedKey: String = "embed"
  private let kPrivacyCommentsKey: String = "comments"
  private let kPrivacyViewKey: String = "view"
  private let kPrivacyDownloadKey: String = "download"
  private let kPrivacyAddKey: String = "add"

  // MARK: Properties
  public var embed: String?
  public var comments: String?
  public var view: String?
  public var download: Bool = false
  public var add: Bool = false

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
    embed <- map[kPrivacyEmbedKey]
    comments <- map[kPrivacyCommentsKey]
    view <- map[kPrivacyViewKey]
    download <- map[kPrivacyDownloadKey]
    add <- map[kPrivacyAddKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = embed { dictionary[kPrivacyEmbedKey] = value }
    if let value = comments { dictionary[kPrivacyCommentsKey] = value }
    if let value = view { dictionary[kPrivacyViewKey] = value }
    dictionary[kPrivacyDownloadKey] = download
    dictionary[kPrivacyAddKey] = add
    return dictionary
  }

}
