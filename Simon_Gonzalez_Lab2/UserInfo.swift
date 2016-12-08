//
//  UserInfo.swift
//  Simon_Gonzalez_Lab2
//
//  Created by macadmin on 2016-03-28.
//  Copyright (c) 2016 macadmin. All rights reserved.
//

import Foundation
import CoreData

class UserInfo: NSManagedObject {
    
    @NSManaged var alberta: String
    @NSManaged var ontario: String
    @NSManaged var quebec: String
    
    @NSManaged var florida: String
    @NSManaged var kansas: String
    @NSManaged var california: String
    
    
}
