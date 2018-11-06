//
//  Files.swift
//
//  Created by Anderson Carvalho on 12/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Files: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kFilesHeightKey: String = "height"
  private let kFilesMd5Key: String = "md5"
  private let kFilesLinkKey: String = "link"
  private let kFilesWidthKey: String = "width"
  private let kFilesSizeKey: String = "size"
  private let kFilesFpsKey: String = "fps"
  private let kFilesQualityKey: String = "quality"
  private let kFilesTypeKey: String = "type"
  private let kFilesCreatedTimeKey: String = "created_time"
  private let kFilesLinkSecureKey: String = "link_secure"

  // MARK: Properties
  public var height: Int?
  public var md5: String?
  public var link: String?
  public var width: Int?
  public var size: Int?
  public var fps: Float?
  public var quality: String?
  public var type: String?
  public var createdTime: String?
  public var linkSecure: String?

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
    height <- map[kFilesHeightKey]
    md5 <- map[kFilesMd5Key]
    link <- map[kFilesLinkKey]
    width <- map[kFilesWidthKey]
    size <- map[kFilesSizeKey]
    fps <- map[kFilesFpsKey]
    quality <- map[kFilesQualityKey]
    type <- map[kFilesTypeKey]
    createdTime <- map[kFilesCreatedTimeKey]
    linkSecure <- map[kFilesLinkSecureKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = height { dictionary[kFilesHeightKey] = value }
    if let value = md5 { dictionary[kFilesMd5Key] = value }
    if let value = link { dictionary[kFilesLinkKey] = value }
    if let value = width { dictionary[kFilesWidthKey] = value }
    if let value = size { dictionary[kFilesSizeKey] = value }
    if let value = fps { dictionary[kFilesFpsKey] = value }
    if let value = quality { dictionary[kFilesQualityKey] = value }
    if let value = type { dictionary[kFilesTypeKey] = value }
    if let value = createdTime { dictionary[kFilesCreatedTimeKey] = value }
    if let value = linkSecure { dictionary[kFilesLinkSecureKey] = value }
    return dictionary
  }

}
