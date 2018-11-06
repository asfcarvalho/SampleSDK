//
//  Download.swift
//
//  Created by Anderson Carvalho on 12/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Download: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kDownloadHeightKey: String = "height"
  private let kDownloadMd5Key: String = "md5"
  private let kDownloadLinkKey: String = "link"
  private let kDownloadWidthKey: String = "width"
  private let kDownloadSizeKey: String = "size"
  private let kDownloadFpsKey: String = "fps"
  private let kDownloadQualityKey: String = "quality"
  private let kDownloadTypeKey: String = "type"
  private let kDownloadExpiresKey: String = "expires"
  private let kDownloadCreatedTimeKey: String = "created_time"

  // MARK: Properties
  public var height: Int?
  public var md5: String?
  public var link: String?
  public var width: Int?
  public var size: Int?
  public var fps: Float?
  public var quality: String?
  public var type: String?
  public var expires: String?
  public var createdTime: String?

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
    height <- map[kDownloadHeightKey]
    md5 <- map[kDownloadMd5Key]
    link <- map[kDownloadLinkKey]
    width <- map[kDownloadWidthKey]
    size <- map[kDownloadSizeKey]
    fps <- map[kDownloadFpsKey]
    quality <- map[kDownloadQualityKey]
    type <- map[kDownloadTypeKey]
    expires <- map[kDownloadExpiresKey]
    createdTime <- map[kDownloadCreatedTimeKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = height { dictionary[kDownloadHeightKey] = value }
    if let value = md5 { dictionary[kDownloadMd5Key] = value }
    if let value = link { dictionary[kDownloadLinkKey] = value }
    if let value = width { dictionary[kDownloadWidthKey] = value }
    if let value = size { dictionary[kDownloadSizeKey] = value }
    if let value = fps { dictionary[kDownloadFpsKey] = value }
    if let value = quality { dictionary[kDownloadQualityKey] = value }
    if let value = type { dictionary[kDownloadTypeKey] = value }
    if let value = expires { dictionary[kDownloadExpiresKey] = value }
    if let value = createdTime { dictionary[kDownloadCreatedTimeKey] = value }
    return dictionary
  }

}
