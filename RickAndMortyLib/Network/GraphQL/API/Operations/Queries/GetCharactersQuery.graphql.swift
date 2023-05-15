// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public extension API {
  class GetCharactersQuery: GraphQLQuery {
    public static let operationName: String = "GetCharacters"
    public static let document: Apollo.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query GetCharacters($page: Int, $filter: FilterCharacter) {
          characters(page: $page, filter: $filter) {
            __typename
            info {
              __typename
              pages
            }
            results {
              __typename
              ...CharacterFragment
            }
          }
        }
        """#,
        fragments: [CharacterFragment.self, LocationFragment.self]
      ))

    public var page: GraphQLNullable<Int>
    public var filter: GraphQLNullable<FilterCharacter>

    public init(
      page: GraphQLNullable<Int>,
      filter: GraphQLNullable<FilterCharacter>
    ) {
      self.page = page
      self.filter = filter
    }

    public var __variables: Variables? { [
      "page": page,
      "filter": filter
    ] }

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { API.Objects.Query }
      public static var __selections: [Apollo.Selection] { [
        .field("characters", Characters?.self, arguments: [
          "page": .variable("page"),
          "filter": .variable("filter")
        ]),
      ] }

      /// Get the list of all characters
      public var characters: Characters? { __data["characters"] }

      /// Characters
      ///
      /// Parent Type: `Characters`
      public struct Characters: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { API.Objects.Characters }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("info", Info?.self),
          .field("results", [Result?]?.self),
        ] }

        public var info: Info? { __data["info"] }
        public var results: [Result?]? { __data["results"] }

        /// Characters.Info
        ///
        /// Parent Type: `Info`
        public struct Info: API.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { API.Objects.Info }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("pages", Int?.self),
          ] }

          /// The amount of pages.
          public var pages: Int? { __data["pages"] }
        }

        /// Characters.Result
        ///
        /// Parent Type: `Character`
        public struct Result: API.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { API.Objects.Character }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .fragment(CharacterFragment.self),
          ] }

          /// The id of the character.
          public var id: API.ID? { __data["id"] }
          /// The name of the character.
          public var name: String? { __data["name"] }
          /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
          public var gender: String? { __data["gender"] }
          /// The species of the character.
          public var species: String? { __data["species"] }
          /// The status of the character ('Alive', 'Dead' or 'unknown').
          public var status: String? { __data["status"] }
          /// Link to the character's image.
          /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
          public var image: String? { __data["image"] }
          /// The character's last known location
          public var location: Location? { __data["location"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var characterFragment: CharacterFragment { _toFragment() }
          }

          /// Characters.Result.Location
          ///
          /// Parent Type: `Location`
          public struct Location: API.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: Apollo.ParentType { API.Objects.Location }

            /// The id of the location.
            public var id: API.ID? { __data["id"] }
            /// The dimension in which the location is located.
            public var dimension: String? { __data["dimension"] }
            /// The name of the location.
            public var name: String? { __data["name"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var locationFragment: LocationFragment { _toFragment() }
            }
          }
        }
      }
    }
  }

}