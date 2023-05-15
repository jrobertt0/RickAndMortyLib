// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public extension API {
  class GetCharacterQuery: GraphQLQuery {
    public static let operationName: String = "GetCharacter"
    public static let document: Apollo.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query GetCharacter($id: ID!) {
          character(id: $id) {
            __typename
            ...CharacterFragment
            episode {
              __typename
              ...EpisodeFragment
            }
            origin {
              __typename
              ...LocationFragment
            }
            type
          }
        }
        """#,
        fragments: [CharacterFragment.self, LocationFragment.self, EpisodeFragment.self]
      ))

    public var id: ID

    public init(id: ID) {
      self.id = id
    }

    public var __variables: Variables? { ["id": id] }

    public struct Data: API.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { API.Objects.Query }
      public static var __selections: [Apollo.Selection] { [
        .field("character", Character?.self, arguments: ["id": .variable("id")]),
      ] }

      /// Get a specific character by ID
      public var character: Character? { __data["character"] }

      /// Character
      ///
      /// Parent Type: `Character`
      public struct Character: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { API.Objects.Character }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("episode", [Episode?].self),
          .field("origin", Origin?.self),
          .field("type", String?.self),
          .fragment(CharacterFragment.self),
        ] }

        /// Episodes in which this character appeared.
        public var episode: [Episode?] { __data["episode"] }
        /// The character's origin location
        public var origin: Origin? { __data["origin"] }
        /// The type or subspecies of the character.
        public var type: String? { __data["type"] }
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

        /// Character.Episode
        ///
        /// Parent Type: `Episode`
        public struct Episode: API.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { API.Objects.Episode }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .fragment(EpisodeFragment.self),
          ] }

          /// The id of the episode.
          public var id: API.ID? { __data["id"] }
          /// The name of the episode.
          public var name: String? { __data["name"] }
          /// The air date of the episode.
          public var air_date: String? { __data["air_date"] }
          /// The code of the episode.
          public var episode: String? { __data["episode"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var episodeFragment: EpisodeFragment { _toFragment() }
          }
        }

        /// Character.Origin
        ///
        /// Parent Type: `Location`
        public struct Origin: API.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: Apollo.ParentType { API.Objects.Location }
          public static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .fragment(LocationFragment.self),
          ] }

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
        /// Character.Location
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