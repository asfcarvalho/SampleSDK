//
//  Embed.swift
//
//  Created by Anderson Carvalho on 12/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Embed: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kEmbedPlaybarKey: String = "playbar"
  private let kEmbedLogosKey: String = "logos"
  private let kEmbedBadgesKey: String = "badges"
  private let kEmbedButtonsKey: String = "buttons"
  private let kEmbedVolumeKey: String = "volume"
  private let kEmbedSpeedKey: String = "speed"
  private let kEmbedTitleKey: String = "title"
  private let kEmbedHtmlKey: String = "html"
  private let kEmbedColorKey: String = "color"

  // MARK: Properties
  public var playbar: Bool = false
  public var logos: Logos?
  public var badges: Badges?
  public var buttons: Buttons?
  public var volume: Bool = false
  public var speed: Bool = false
  public var title: Title?
  public var html: String?
  public var color: String?

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
    playbar <- map[kEmbedPlaybarKey]
    logos <- map[kEmbedLogosKey]
    badges <- map[kEmbedBadgesKey]
    buttons <- map[kEmbedButtonsKey]
    volume <- map[kEmbedVolumeKey]
    speed <- map[kEmbedSpeedKey]
    title <- map[kEmbedTitleKey]
    html <- map[kEmbedHtmlKey]
    color <- map[kEmbedColorKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[kEmbedPlaybarKey] = playbar
    if let value = logos { dictionary[kEmbedLogosKey] = value.dictionaryRepresentation() }
    if let value = badges { dictionary[kEmbedBadgesKey] = value.dictionaryRepresentation() }
    if let value = buttons { dictionary[kEmbedButtonsKey] = value.dictionaryRepresentation() }
    dictionary[kEmbedVolumeKey] = volume
    dictionary[kEmbedSpeedKey] = speed
    if let value = title { dictionary[kEmbedTitleKey] = value.dictionaryRepresentation() }
    if let value = html { dictionary[kEmbedHtmlKey] = value }
    if let value = color { dictionary[kEmbedColorKey] = value }
    return dictionary
  }

}
