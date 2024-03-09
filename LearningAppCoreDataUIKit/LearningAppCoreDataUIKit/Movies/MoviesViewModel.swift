//
//  MoviesViewModel.swift
//  LearningAppCoreDataUIKit
//
//  Created by Saurabh Verma on 07/03/24.
//

import Foundation
import CoreData
import UIKit

protocol MoviesViewModelProtocol {
    var managedContext: NSManagedObjectContext { get }
    func fetchAllMovies()
}

class MoviesViewModel: MoviesViewModelProtocol {
    var managedContext: NSManagedObjectContext
    
    // TODO: Should this be initialized to empty
    // TODO: Should this be restricted
    var movies = [Movie]()
    
    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
    }
    
    func fetchAllMovies() {
        var fetchedMovies = [Movie]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Movie")
        do {
            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            for data in result {
                fetchedMovies.append(data as! Movie)
            }
            movies = fetchedMovies
        } catch {
            print("Some error occurred while trying to fetch movies")
        }
    }
    
    func addMovie(title: String, director: String, cast: String, genre: String) {
        let movieEntity = NSEntityDescription.entity(forEntityName: "Movie", in: managedContext)!
        let newMovie = NSManagedObject(entity: movieEntity, insertInto: managedContext)
        newMovie.setValue(title, forKey: "title")
        newMovie.setValue(director, forKey: "director")
        newMovie.setValue(cast, forKey: "cast")
        newMovie.setValue(genre, forKey: "genre")
        do {
            try managedContext.save()
            fetchAllMovies()
        } catch {
            print("Error while saving new movie to managedContext")
        }
    }
}
