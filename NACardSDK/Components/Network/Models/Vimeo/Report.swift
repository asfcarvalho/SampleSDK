//
//  Report.swift
//
//  Created by Anderson Carvalho on 12/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class Report: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kReportUriKey: String = "uri"
  private let kReportOptionsKey: String = "options"
  private let kReportReasonKey: String = "reason"

  // MARK: Properties
  public var uri: String?
  public var options: [String]?
  public var reason: [String]?

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
    uri <- map[kReportUriKey]
    options <- map[kReportOptionsKey]
    reason <- map[kReportReasonKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = uri { dictionary[kReportUriKey] = value }
    if let value = options { dictionary[kReportOptionsKey] = value }
    if let value = reason { dictionary[kReportReasonKey] = value }
    return dictionary
  }

}
