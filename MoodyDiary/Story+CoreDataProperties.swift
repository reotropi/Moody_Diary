//
//  Story+CoreDataProperties.swift
//  MoodyDiary
//
//  Created by Aida Fitryani on 5/6/17.
//  Copyright © 2017 IS535. All rights reserved.
//

import Foundation
import CoreData


extension Story {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Story> {
        return NSFetchRequest<Story>(entityName: "Story");
    }

    @NSManaged public var date: String?
    @NSManaged public var mood: String?
    @NSManaged public var story: String?

}
