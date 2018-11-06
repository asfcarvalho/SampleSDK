//
//  Buttons.swift
//
//  Created by Anderson Carvalho on 12/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Buttons: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kButtonsWatchlaterKey: String = "watchlater"
  private let kButtonsShareKey: String = "share"
  private let kButtonsFullscreenKey: String = "fullscreen"
  private let kButtonsHdKey: String = "hd"
  private let kButtonsEmbedKey: String = "embed"
  private let kButtonsLikeKey: String = "like"
  private let kButtonsScalingKey: String = "scaling"

  // MARK: Properties
  public var watchlater: Bool = false
  public var share: Bool = false
  public var fullscreen: Bool = false
  public var hd: Bool = false
  public var embed: Bool = false
  public var like: Bool = false
  public var scaling: Bool = false

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
    watchlater <- map[kButtonsWatchlaterKey]
    share <- map[kButtonsShareKey]
    fullscreen <- map[kButtonsFullscreenKey]
    hd <- map[kButtonsHdKey]
    embed <- map[kButtonsEmbedKey]
    like <- map[kButtonsLikeKey]
    scaling <- map[kButtonsScalingKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[kButtonsWatchlaterKey] = watchlater
    dictionary[kButtonsShareKey] = share
    dictionary[kButtonsFullscreenKey] = fullscreen
    dictionary[kButtonsHdKey] = hd
    dictionary[kButtonsEmbedKey] = embed
    dictionary[kButtonsLikeKey] = like
    dictionary[kButtonsScalingKey] = scaling
    return dictionary
  }

}
