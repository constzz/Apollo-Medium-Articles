//
//  ViewController.swift
//  Apollo Medium Article
//
//  Created by Konstantin Bezzemelnyi on 11.06.2022.
//

import UIKit
import Apollo

class ViewController: UIViewController {
    
    private let apollo = ApolloClient(url: URL(string: "https://fruits-api.netlify.app/graphql")!)

    override func viewDidLoad() {
        super.viewDidLoad()
        getFruits { [weak self] fruits in
            guard let safeSelf = self else { return }
            if let fruits = fruits {
                print("Fruits API knows \(fruits.count) types of fruits:")
                for (index, element) in fruits.enumerated() {
                    print("\(index+1). \(element.fruitName ?? "Unknown name")")
                }
                
                // Pay attention that id is of String type, so need to convert it
                let fruitId = String(Int.random(in: 1_000..<10_000))
                let fruitName = "Apple"
                
                safeSelf.addFruit(with: fruitId, fruitName: fruitName) { addedFruitName in
                    guard let addedFruitName = addedFruitName else { return }
                    print("You have added \(addedFruitName)")
                }
            }
        }
    }
    
    private func getFruits(completion: @escaping ([GetAllFruitsQuery.Data.Fruit]?) -> Void) {
        apollo.fetch(query: GetAllFruitsQuery()) { result in
            switch result {
            case .success(let graphqlResult):
                if let data = graphqlResult.data,
                   let fruits = data.fruits {
                    completion(fruits.compactMap { $0 })
                }
                if let errors = graphqlResult.errors, !errors.isEmpty {
                    print("GraphQL errors:")
                    errors.forEach {
                        print($0.localizedDescription)
                    }
                }
            case .failure(let error):
                completion(nil)
                print(error.localizedDescription)
            }
        }
    }
    
    private func addFruit(with id: String, fruitName: String, completion: @escaping (_ addedFruitName: String?) -> Void) {
        apollo.perform(mutation: AddFruitMutation(addFruitId: id, scientificName: "", treeName: "", fruitName: fruitName, family: "", origin: "", description: "", bloom: "", maturationFruit: "", lifeCycle: "", climaticZone: "")) { result in
            switch result {
            case .success(let graphqlResult):
                if let data = graphqlResult.data,
                   let fruitName = data.addFruit.fruitName{
                    completion(fruitName)
                }
                if let errors = graphqlResult.errors, !errors.isEmpty {
                    print("GraphQL errors:")
                    errors.forEach {
                        print($0.localizedDescription)
                    }
                }
            case .failure(let error):
                completion(nil)
                print(error.localizedDescription)
            }
        }
    }

}

