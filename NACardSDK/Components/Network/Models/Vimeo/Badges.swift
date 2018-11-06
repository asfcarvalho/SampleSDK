//
//  Badges.swift
//
//  Created by Anderson Carvalho on 12/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Badges: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kBadgesVodKey: String = "vod"
  private let kBadgesStaffPickKey: String = "staff_pick"
  private let kBadgesHdrKey: String = "hdr"
  private let kBadgesLiveKey: String = "live"
  private let kBadgesWeekendChallengeKey: String = "weekend_challenge"

  // MARK: Properties
  public var vod: Bool = false
  public var staffPick: StaffPick?
  public var hdr: Bool = false
  public var live: Live?
  public var weekendChallenge: Bool = false

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
    vod <- map[kBadgesVodKey]
    staffPick <- map[kBadgesStaffPickKey]
    hdr <- map[kBadgesHdrKey]
    live <- map[kBadgesLiveKey]
    weekendChallenge <- map[kBadgesWeekendChallengeKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[kBadgesVodKey] = vod
    if let value = staffPick { dictionary[kBadgesStaffPickKey] = value.dictionaryRepresentation() }
    dictionary[kBadgesHdrKey] = hdr
    if let value = live { dictionary[kBadgesLiveKey] = value.dictionaryRepresentation() }
    dictionary[kBadgesWeekendChallengeKey] = weekendChallenge
    return dictionary
  }

}
