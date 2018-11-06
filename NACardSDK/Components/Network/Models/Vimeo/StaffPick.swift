//
//  StaffPick.swift
//
//  Created by Anderson Carvalho on 12/09/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class StaffPick: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kStaffPickBestOfTheMonthKey: String = "best_of_the_month"
  private let kStaffPickBestOfTheYearKey: String = "best_of_the_year"
  private let kStaffPickPremiereKey: String = "premiere"
  private let kStaffPickNormalKey: String = "normal"

  // MARK: Properties
  public var bestOfTheMonth: Bool = false
  public var bestOfTheYear: Bool = false
  public var premiere: Bool = false
  public var normal: Bool = false

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
    bestOfTheMonth <- map[kStaffPickBestOfTheMonthKey]
    bestOfTheYear <- map[kStaffPickBestOfTheYearKey]
    premiere <- map[kStaffPickPremiereKey]
    normal <- map[kStaffPickNormalKey]
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[kStaffPickBestOfTheMonthKey] = bestOfTheMonth
    dictionary[kStaffPickBestOfTheYearKey] = bestOfTheYear
    dictionary[kStaffPickPremiereKey] = premiere
    dictionary[kStaffPickNormalKey] = normal
    return dictionary
  }

}
