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
        getFruits { fruits in
            if let fruits = fruits {
                print("Fruits API knows \(fruits.count) types of fruits:")
                for (index, element) in fruits.enumerated() {
                    print("\(index+1). \(element.fruitName ?? "Unknown name")")
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

}

