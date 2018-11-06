//
//  Sizes.swift
//
//  Created by Anderson Carvalho on 12/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Sizes: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kSizesLinkKey: String = "link"
  private let kSizesHeightKey: String = "height"
  private let kSizesLinkWithPlayButtonKey: String = "link_with_play_button"
  private let kSizesWidthKey: String = "width"

  // MARK: Properties
  public var link: String?
  public var height: Int?
  public var linkWithPlayButton: String?
  public var width: Int?

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
    link <- map[kSizesLinkKey]
    height <- map[kSizesHeightKey]
    linkWithPlayButton <- map[kSizesLinkWithPlayButtonKey]
    width <- map[kSizesWidthKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = link { dictionary[kSizesLinkKey] = value }
    if let value = height { dictionary[kSizesHeightKey] = value }
    if let value = linkWithPlayButton { dictionary[kSizesLinkWithPlayButtonKey] = value }
    if let value = width { dictionary[kSizesWidthKey] = value }
    return dictionary
  }

}
