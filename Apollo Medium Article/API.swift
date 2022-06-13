// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class AddFruitMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AddFruit($addFruitId: ID!, $scientificName: String!, $treeName: String!, $fruitName: String!, $family: String!, $origin: String!, $description: String!, $bloom: String!, $maturationFruit: String!, $lifeCycle: String!, $climaticZone: String!) {
      addFruit(
        id: $addFruitId
        scientific_name: $scientificName
        tree_name: $treeName
        fruit_name: $fruitName
        family: $family
        origin: $origin
        description: $description
        bloom: $bloom
        maturation_fruit: $maturationFruit
        life_cycle: $lifeCycle
        climatic_zone: $climaticZone
      ) {
        __typename
        fruit_name
      }
    }
    """

  public let operationName: String = "AddFruit"

  public var addFruitId: GraphQLID
  public var scientificName: String
  public var treeName: String
  public var fruitName: String
  public var family: String
  public var origin: String
  public var description: String
  public var bloom: String
  public var maturationFruit: String
  public var lifeCycle: String
  public var climaticZone: String

  public init(addFruitId: GraphQLID, scientificName: String, treeName: String, fruitName: String, family: String, origin: String, description: String, bloom: String, maturationFruit: String, lifeCycle: String, climaticZone: String) {
    self.addFruitId = addFruitId
    self.scientificName = scientificName
    self.treeName = treeName
    self.fruitName = fruitName
    self.family = family
    self.origin = origin
    self.description = description
    self.bloom = bloom
    self.maturationFruit = maturationFruit
    self.lifeCycle = lifeCycle
    self.climaticZone = climaticZone
  }

  public var variables: GraphQLMap? {
    return ["addFruitId": addFruitId, "scientificName": scientificName, "treeName": treeName, "fruitName": fruitName, "family": family, "origin": origin, "description": description, "bloom": bloom, "maturationFruit": maturationFruit, "lifeCycle": lifeCycle, "climaticZone": climaticZone]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("addFruit", arguments: ["id": GraphQLVariable("addFruitId"), "scientific_name": GraphQLVariable("scientificName"), "tree_name": GraphQLVariable("treeName"), "fruit_name": GraphQLVariable("fruitName"), "family": GraphQLVariable("family"), "origin": GraphQLVariable("origin"), "description": GraphQLVariable("description"), "bloom": GraphQLVariable("bloom"), "maturation_fruit": GraphQLVariable("maturationFruit"), "life_cycle": GraphQLVariable("lifeCycle"), "climatic_zone": GraphQLVariable("climaticZone")], type: .nonNull(.object(AddFruit.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addFruit: AddFruit) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addFruit": addFruit.resultMap])
    }

    public var addFruit: AddFruit {
      get {
        return AddFruit(unsafeResultMap: resultMap["addFruit"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "addFruit")
      }
    }

    public struct AddFruit: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Fruits"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("fruit_name", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(fruitName: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Fruits", "fruit_name": fruitName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fruitName: String? {
        get {
          return resultMap["fruit_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "fruit_name")
        }
      }
    }
  }
}

public final class GetAllFruitsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAllFruits {
      fruits {
        __typename
        fruit_name
      }
    }
    """

  public let operationName: String = "GetAllFruits"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("fruits", type: .list(.object(Fruit.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(fruits: [Fruit?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "fruits": fruits.flatMap { (value: [Fruit?]) -> [ResultMap?] in value.map { (value: Fruit?) -> ResultMap? in value.flatMap { (value: Fruit) -> ResultMap in value.resultMap } } }])
    }

    public var fruits: [Fruit?]? {
      get {
        return (resultMap["fruits"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Fruit?] in value.map { (value: ResultMap?) -> Fruit? in value.flatMap { (value: ResultMap) -> Fruit in Fruit(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Fruit?]) -> [ResultMap?] in value.map { (value: Fruit?) -> ResultMap? in value.flatMap { (value: Fruit) -> ResultMap in value.resultMap } } }, forKey: "fruits")
      }
    }

    public struct Fruit: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Fruits"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("fruit_name", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(fruitName: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Fruits", "fruit_name": fruitName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fruitName: String? {
        get {
          return resultMap["fruit_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "fruit_name")
        }
      }
    }
  }
}
