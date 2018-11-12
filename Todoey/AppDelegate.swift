//
//  AppDelegate.swift
//  Todoey
//
//  Created by David King on 11/6/18.
//  Copyright © 2018 Renovatio Concept Manifest. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
    
        
        do {
            let realm = try Realm()
            } catch {
            print("error initialising new realm, \(error)")
        }
        
        return true
        
    }
        
    func applicationWillTerminate(_ application: UIApplication) {
        
        self.saveContext()
    }
    
    //MARK: Core Data Stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
            
           
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // Mark: - Core Data Saving Support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
            
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
