//
//  Meal.swift
//  FoodTracker
//
//  Created by Jane Appleseed on 11/10/16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

// Sydney Hwang
// Note! I tried to add code for the save button I created
// but it kept giving me errors, so I coded out the parts
// that gave me errors with "//" so you can see what I tried
// to do I did the same thing with the code in
// MealViewController.swift so the save button
// on the ingredients and instructions page doesn't do anything

import UIKit
import os.log


class Meal: NSObject, NSCoding {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    // add ingredients and method String variables here
    // var ingredients: String
    // var instructions: String
    // add ingredients and method String variables here
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    //MARK: Types
    
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
        // add ingredients and method static lets here
        // static let ingredients = "ingredients"
        // static let instructions = "instructions"
    }
    
    //MARK: Initialization
    // add ingredients and method to init? header
    
    init?(name: String, photo: UIImage?, rating: Int) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }

        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0  {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        // Initialize stored properties ingredients and method here
        // self.ingredients = ingredients
        // self.instructions = instructions
        
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
        // add ingredients and method here
        // aCoder.encode(ingredients, forKey: PropertyKey.ingredients)
        // aCoder.encode(instructions, forKey: PropertyKey.instructions)
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Because photo is an optional property of Meal, just use conditional cast.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        
        // initialize ingredients and method here
        
        // Must call designated initializer.
        // add ingredients and method here
        self.init(name: name, photo: photo, rating: rating)
        // ingredients: ingredients, instructions: instructions)
        
        
    }
}
