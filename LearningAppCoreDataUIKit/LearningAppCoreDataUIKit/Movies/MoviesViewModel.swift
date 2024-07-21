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
    func fetch(director: String) -> Director?
    func addMovie(title: String, length: Int16, yearOfRelease: Int16)
    func addMovie(title: String, length: Int16, yearOfRelease: Int16, director: String)
    func deleteMovie(at indexPath: IndexPath, completion: BasicBlock)
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
    
    func fetch(director: String) -> Director? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Director")
        fetchRequest.predicate = NSPredicate(format: "name == %@", director)
        var fetchedDirector: Director?
        do {
            let results = try managedContext.fetch(fetchRequest)
            if let director = results.first {
                fetchedDirector = director as? Director
            }
        } catch {
            print("Error while fetching director :: \(director)")
        }
        return fetchedDirector
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
    
    func addMovie(title: String, length: Int16, yearOfRelease: Int16, director: String) {
        let movieEntity = NSEntityDescription.entity(forEntityName: "Movie", in: managedContext)!
        let newMovie = Movie(entity: movieEntity, insertInto: managedContext)
        newMovie.id = UUID()
        newMovie.title = title
        newMovie.length = length
        newMovie.year = yearOfRelease
        if let movieDirector = fetch(director: director) {
            newMovie.director = movieDirector
        }
        do {
            try managedContext.save()
            fetchAllMovies()
        } catch {
            print("Error while saving new movie to managedContext")
        }
    }
    
    func deleteMovie(at indexPath: IndexPath, completion: BasicBlock) {
        managedContext.delete(movies[indexPath.row])
        movies.remove(at: indexPath.row)
        do {
            try managedContext.save()
            completion()
        } catch {
            print("Error while saving managedContext after delete")
        }
    }
    
    func undoLastChange() {
        if managedContext.undoManager?.canUndo == true {
            managedContext.undoManager?.undo()
        }
    }
}
