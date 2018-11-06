//
//  Metadata.swift
//
//  Created by Anderson Carvalho on 05/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Metadata: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kMetadataIconKey: String = "icon"
  private let kMetadataActionKey: String = "action"
  private let kMetadataNewTabKey: String = "newTab"
  private let kMetadataTypeKey: String = "type"
  private let kMetadataCategoryKey: String = "category"
  private let kMetadataThumbKey: String = "thumb"
  private let kMetadataMetaTagsKey: String = "meta_tags"
  private let kMetadataImageKey: String = "image"
  private let kMetadataTextKey: String = "text"
  private let kMetadataUrlsKey: String = "urls"
  private let kMetadataTitleKey: String = "title"
  private let kMetadataActionsKey: String = "actions"
  private let kMetadataDurationKey: String = "duration"
  private let kMetadataUrlKey: String = "url"
    private let kMetadataHomeKey: String = "home"

  // MARK: Properties
  public var icon: String?
  public var action: String?
  public var newTab: Bool = false
  public var type: String?
  public var category: String?
  public var thumb: String?
  public var metaTags: [MetaTags]?
  public var image: String?
  public var text: String?
  public var urls: [Urls]?
  public var title: String?
  public var actions: [Actions]?
  public var duration: String?
  public var url: String?
    public var home: Bool? = true

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
    icon <- map[kMetadataIconKey]
    action <- map[kMetadataActionKey]
    newTab <- map[kMetadataNewTabKey]
    type <- map[kMetadataTypeKey]
    category <- map[kMetadataCategoryKey]
    thumb <- map[kMetadataThumbKey]
    metaTags <- map[kMetadataMetaTagsKey]
    image <- map[kMetadataImageKey]
    text <- map[kMetadataTextKey]
    urls <- map[kMetadataUrlsKey]
    title <- map[kMetadataTitleKey]
    actions <- map[kMetadataActionsKey]
    duration <- map[kMetadataDurationKey]
    url <- map[kMetadataUrlKey]
    home <- map[kMetadataHomeKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = icon { dictionary[kMetadataIconKey] = value }
    if let value = action { dictionary[kMetadataActionKey] = value }
    dictionary[kMetadataNewTabKey] = newTab
    if let value = type { dictionary[kMetadataTypeKey] = value }
    if let value = category { dictionary[kMetadataCategoryKey] = value }
    if let value = thumb { dictionary[kMetadataThumbKey] = value }
    if let value = metaTags { dictionary[kMetadataMetaTagsKey] = value.map { $0.dictionaryRepresentation() } }
    if let value = image { dictionary[kMetadataImageKey] = value }
    if let value = text { dictionary[kMetadataTextKey] = value }
    if let value = urls { dictionary[kMetadataUrlsKey] = value.map { $0.dictionaryRepresentation() } }
    if let value = title { dictionary[kMetadataTitleKey] = value }
    if let value = actions { dictionary[kMetadataActionsKey] = value.map { $0.dictionaryRepresentation() } }
    if let value = duration { dictionary[kMetadataDurationKey] = value }
    if let value = url { dictionary[kMetadataUrlKey] = value }
    if let value = home { dictionary[kMetadataHomeKey] = value}
    return dictionary
  }

}
