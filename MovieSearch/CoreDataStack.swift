//
//  CoreDataStack.swift
//  MovieSearch
//
//  Created by Christian McMullin on 2/17/17.
//  Copyright © 2017 Christian McMullin. All rights reserved.
//

import Foundation
import CoreData

enum CoreDataStack {
    // an instance of NSPersistentContainer is where the data is stored
    static let container: NSPersistentContainer = {
        
        //grabs the name of the app and sets it as a string
        let appName = Bundle.main.object(forInfoDictionaryKey: (kCFBundleNameKey as String)) as! String
        // setting the container to the name of the app
        let container = NSPersistentContainer(name: appName)
        //loads container with the description and if nothing is found then it throws an error
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        //the container is now set up to be able to save and load data from this app
        return container
    }()
    // I believe this code is how to see what data is stored?
    static var context: NSManagedObjectContext { return container.viewContext }
}
