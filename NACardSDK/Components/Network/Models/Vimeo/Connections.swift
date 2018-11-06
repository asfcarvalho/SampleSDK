//
//  Connections.swift
//
//  Created by Anderson Carvalho on 12/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Connections: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kConnectionsPortfoliosKey: String = "portfolios"
  private let kConnectionsWatchlaterKey: String = "watchlater"
  private let kConnectionsPicturesKey: String = "pictures"
  private let kConnectionsLikesKey: String = "likes"
  private let kConnectionsWatchedVideosKey: String = "watched_videos"
  private let kConnectionsBlockKey: String = "block"
  private let kConnectionsAlbumsKey: String = "albums"
  private let kConnectionsSharedKey: String = "shared"
  private let kConnectionsAppearancesKey: String = "appearances"
  private let kConnectionsGroupsKey: String = "groups"
  private let kConnectionsModeratedChannelsKey: String = "moderated_channels"
  private let kConnectionsCategoriesKey: String = "categories"
  private let kConnectionsFeedKey: String = "feed"
  private let kConnectionsChannelsKey: String = "channels"
  private let kConnectionsVideosKey: String = "videos"
  private let kConnectionsActivitiesKey: String = "activities"
  private let kConnectionsFollowersKey: String = "followers"
  private let kConnectionsFollowingKey: String = "following"

  // MARK: Properties
  public var portfolios: Portfolios?
  public var watchlater: Watchlater?
  public var pictures: Pictures?
  public var likes: Likes?
  public var watchedVideos: WatchedVideos?
  public var block: Block?
  public var albums: Albums?
  public var shared: Shared?
  public var appearances: Appearances?
  public var groups: Groups?
  public var moderatedChannels: ModeratedChannels?
  public var categories: Categories?
  public var feed: Feed?
  public var channels: Channels?
  public var videos: Videos?
  public var activities: Activities?
  public var followers: Followers?
  public var following: Following?

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
    portfolios <- map[kConnectionsPortfoliosKey]
    watchlater <- map[kConnectionsWatchlaterKey]
    pictures <- map[kConnectionsPicturesKey]
    likes <- map[kConnectionsLikesKey]
    watchedVideos <- map[kConnectionsWatchedVideosKey]
    block <- map[kConnectionsBlockKey]
    albums <- map[kConnectionsAlbumsKey]
    shared <- map[kConnectionsSharedKey]
    appearances <- map[kConnectionsAppearancesKey]
    groups <- map[kConnectionsGroupsKey]
    moderatedChannels <- map[kConnectionsModeratedChannelsKey]
    categories <- map[kConnectionsCategoriesKey]
    feed <- map[kConnectionsFeedKey]
    channels <- map[kConnectionsChannelsKey]
    videos <- map[kConnectionsVideosKey]
    activities <- map[kConnectionsActivitiesKey]
    followers <- map[kConnectionsFollowersKey]
    following <- map[kConnectionsFollowingKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = portfolios { dictionary[kConnectionsPortfoliosKey] = value.dictionaryRepresentation() }
    if let value = watchlater { dictionary[kConnectionsWatchlaterKey] = value.dictionaryRepresentation() }
    if let value = pictures { dictionary[kConnectionsPicturesKey] = value.dictionaryRepresentation() }
    if let value = likes { dictionary[kConnectionsLikesKey] = value.dictionaryRepresentation() }
    if let value = watchedVideos { dictionary[kConnectionsWatchedVideosKey] = value.dictionaryRepresentation() }
    if let value = block { dictionary[kConnectionsBlockKey] = value.dictionaryRepresentation() }
    if let value = albums { dictionary[kConnectionsAlbumsKey] = value.dictionaryRepresentation() }
    if let value = shared { dictionary[kConnectionsSharedKey] = value.dictionaryRepresentation() }
    if let value = appearances { dictionary[kConnectionsAppearancesKey] = value.dictionaryRepresentation() }
    if let value = groups { dictionary[kConnectionsGroupsKey] = value.dictionaryRepresentation() }
    if let value = moderatedChannels { dictionary[kConnectionsModeratedChannelsKey] = value.dictionaryRepresentation() }
    if let value = categories { dictionary[kConnectionsCategoriesKey] = value.dictionaryRepresentation() }
    if let value = feed { dictionary[kConnectionsFeedKey] = value.dictionaryRepresentation() }
    if let value = channels { dictionary[kConnectionsChannelsKey] = value.dictionaryRepresentation() }
    if let value = videos { dictionary[kConnectionsVideosKey] = value.dictionaryRepresentation() }
    if let value = activities { dictionary[kConnectionsActivitiesKey] = value.dictionaryRepresentation() }
    if let value = followers { dictionary[kConnectionsFollowersKey] = value.dictionaryRepresentation() }
    if let value = following { dictionary[kConnectionsFollowingKey] = value.dictionaryRepresentation() }
    return dictionary
  }

}
