//
//  VimeoResponse.swift
//
//  Created by Anderson Carvalho on 12/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class VimeoResponse: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kVimeoResponseEmbedKey: String = "embed"
  private let kVimeoResponseCreatedTimeKey: String = "created_time"
  private let kVimeoResponseTagsKey: String = "tags"
  private let kVimeoResponseFilesKey: String = "files"
  private let kVimeoResponsePrivacyKey: String = "privacy"
  private let kVimeoResponseReleaseTimeKey: String = "release_time"
  private let kVimeoResponseDurationKey: String = "duration"
  private let kVimeoResponseDownloadKey: String = "download"
  private let kVimeoResponseMetadataKey: String = "metadata"
  private let kVimeoResponseTranscodeKey: String = "transcode"
  private let kVimeoResponseNameKey: String = "name"
  private let kVimeoResponseUserKey: String = "user"
  private let kVimeoResponseUriKey: String = "uri"
  private let kVimeoResponseResourceKeyKey: String = "resource_key"
  private let kVimeoResponsePicturesKey: String = "pictures"
  private let kVimeoResponseWidthKey: String = "width"
  private let kVimeoResponseModifiedTimeKey: String = "modified_time"
  private let kVimeoResponseReviewLinkKey: String = "review_link"
  private let kVimeoResponseStatsKey: String = "stats"
  private let kVimeoResponseLinkKey: String = "link"
  private let kVimeoResponseStatusKey: String = "status"
  private let kVimeoResponseHeightKey: String = "height"
  private let kVimeoResponseContentRatingKey: String = "content_rating"
  private let kVimeoResponseUploadKey: String = "upload"
  private let kVimeoResponseLastUserActionEventDateKey: String = "last_user_action_event_date"
    private let kVimeoResponseErrorKey: String = "error"

  // MARK: Properties
  public var embed: Embed?
  public var createdTime: String?
  public var tags: [Any]?
  public var files: [Files]?
  public var privacy: Privacy?
  public var releaseTime: String?
  public var duration: Int?
  public var download: [Download]?
  public var metadata: MetadataVimeo?
  public var transcode: Transcode?
  public var name: String?
  public var user: User?
  public var uri: String?
  public var resourceKey: String?
  public var pictures: Pictures?
  public var width: Int?
  public var modifiedTime: String?
  public var reviewLink: String?
  public var stats: Stats?
  public var link: String?
  public var status: String?
  public var height: Int?
  public var contentRating: [String]?
  public var upload: Upload?
  public var lastUserActionEventDate: String?
  public var error: String?

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
    embed <- map[kVimeoResponseEmbedKey]
    createdTime <- map[kVimeoResponseCreatedTimeKey]
    tags <- map[kVimeoResponseTagsKey]
    files <- map[kVimeoResponseFilesKey]
    privacy <- map[kVimeoResponsePrivacyKey]
    releaseTime <- map[kVimeoResponseReleaseTimeKey]
    duration <- map[kVimeoResponseDurationKey]
    download <- map[kVimeoResponseDownloadKey]
    metadata <- map[kVimeoResponseMetadataKey]
    transcode <- map[kVimeoResponseTranscodeKey]
    name <- map[kVimeoResponseNameKey]
    user <- map[kVimeoResponseUserKey]
    uri <- map[kVimeoResponseUriKey]
    resourceKey <- map[kVimeoResponseResourceKeyKey]
    pictures <- map[kVimeoResponsePicturesKey]
    width <- map[kVimeoResponseWidthKey]
    modifiedTime <- map[kVimeoResponseModifiedTimeKey]
    reviewLink <- map[kVimeoResponseReviewLinkKey]
    stats <- map[kVimeoResponseStatsKey]
    link <- map[kVimeoResponseLinkKey]
    status <- map[kVimeoResponseStatusKey]
    height <- map[kVimeoResponseHeightKey]
    contentRating <- map[kVimeoResponseContentRatingKey]
    upload <- map[kVimeoResponseUploadKey]
    lastUserActionEventDate <- map[kVimeoResponseLastUserActionEventDateKey]
    error <- map[kVimeoResponseErrorKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = embed { dictionary[kVimeoResponseEmbedKey] = value.dictionaryRepresentation() }
    if let value = createdTime { dictionary[kVimeoResponseCreatedTimeKey] = value }
    if let value = tags { dictionary[kVimeoResponseTagsKey] = value }
    if let value = files { dictionary[kVimeoResponseFilesKey] = value.map { $0.dictionaryRepresentation() } }
    if let value = privacy { dictionary[kVimeoResponsePrivacyKey] = value.dictionaryRepresentation() }
    if let value = releaseTime { dictionary[kVimeoResponseReleaseTimeKey] = value }
    if let value = duration { dictionary[kVimeoResponseDurationKey] = value }
    if let value = download { dictionary[kVimeoResponseDownloadKey] = value.map { $0.dictionaryRepresentation() } }
    if let value = metadata { dictionary[kVimeoResponseMetadataKey] = value.dictionaryRepresentation() }
    if let value = transcode { dictionary[kVimeoResponseTranscodeKey] = value.dictionaryRepresentation() }
    if let value = name { dictionary[kVimeoResponseNameKey] = value }
    if let value = user { dictionary[kVimeoResponseUserKey] = value.dictionaryRepresentation() }
    if let value = uri { dictionary[kVimeoResponseUriKey] = value }
    if let value = resourceKey { dictionary[kVimeoResponseResourceKeyKey] = value }
    if let value = pictures { dictionary[kVimeoResponsePicturesKey] = value.dictionaryRepresentation() }
    if let value = width { dictionary[kVimeoResponseWidthKey] = value }
    if let value = modifiedTime { dictionary[kVimeoResponseModifiedTimeKey] = value }
    if let value = reviewLink { dictionary[kVimeoResponseReviewLinkKey] = value }
    if let value = stats { dictionary[kVimeoResponseStatsKey] = value.dictionaryRepresentation() }
    if let value = link { dictionary[kVimeoResponseLinkKey] = value }
    if let value = status { dictionary[kVimeoResponseStatusKey] = value }
    if let value = height { dictionary[kVimeoResponseHeightKey] = value }
    if let value = contentRating { dictionary[kVimeoResponseContentRatingKey] = value }
    if let value = upload { dictionary[kVimeoResponseUploadKey] = value.dictionaryRepresentation() }
    if let value = lastUserActionEventDate { dictionary[kVimeoResponseLastUserActionEventDateKey] = value }
    if let value = error { dictionary[kVimeoResponseErrorKey] = value }
    return dictionary
  }

}
