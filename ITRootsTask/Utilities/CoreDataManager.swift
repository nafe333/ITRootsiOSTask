//
//  CoreDataManager.swift
//  ITRootsTask
//
//  Created by Nafea Elkassas on 28/01/2026.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    
       //MARK: - Properties
    static let shared = CoreDataManager()
    private var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var context: NSManagedObjectContext {
        return appDelegate.persistentContainer.viewContext
    }
    
       //MARK: - Behaviour
    func savePost(id: Int, body: String, title: String) {
           DispatchQueue.main.async {
               let post = PostEntity(context: self.context)
               post.id = Int16(id)
               post.body = body
               post.title = title
               do {
                   try self.context.save()
               } catch {
                   print("Failed saving Post:", error)
               }
           }
       }
       
    func fetchPosts(completion: @escaping ([PostEntity]) -> Void) {
        DispatchQueue.main.async {
            let request = NSFetchRequest<PostEntity>(entityName: "PostEntity")
            do {
                let result = try self.context.fetch(request)
                completion(result)
            } catch {
                completion([])
            }
        }
    }
       
    func clearPosts() {
        DispatchQueue.main.async {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PostEntity")
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            
            do {
                try self.context.execute(deleteRequest)
                try self.context.save()
            } catch {
                print("Failed to clear posts:", error)
            }
        }
    }
}
