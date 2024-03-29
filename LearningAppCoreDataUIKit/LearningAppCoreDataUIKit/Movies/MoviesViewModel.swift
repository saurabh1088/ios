//
//  MoviesViewModel.swift
//  LearningAppCoreDataUIKit
//
//  Created by Saurabh Verma on 07/03/24.
//

import Foundation
import CoreData
import UIKit

protocol HasManagedContext {
    var managedContext: NSManagedObjectContext { get }
}

protocol MoviesViewModelProtocol: HasManagedContext {
    func fetchAllMovies()
    func addMovie(title: String, length: Int16, yearOfRelease: Int16)
    func deleteMovie(at indexPath: IndexPath)
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
    
    func addMovie(title: String, length: Int16, yearOfRelease: Int16) {
        let movieEntity = NSEntityDescription.entity(forEntityName: "Movie", in: managedContext)!
        let newMovie = NSManagedObject(entity: movieEntity, insertInto: managedContext)
        newMovie.setValue(UUID(), forKey: "id")
        newMovie.setValue(title, forKey: "title")
        newMovie.setValue(length, forKey: "length")
        newMovie.setValue(yearOfRelease, forKey: "yearOfRelease")
        do {
            try managedContext.save()
            fetchAllMovies()
        } catch {
            print("Error while saving new movie to managedContext")
        }
    }
    
    func deleteMovie(at indexPath: IndexPath) {
        managedContext.delete(movies[indexPath.row])
        movies.remove(at: indexPath.row)
        do {
            try managedContext.save()
        } catch {
            print("Error while saving managedContext after delete")
        }
    }
}
