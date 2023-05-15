// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public extension API {
  class GetEpisodeQuery: GraphQLQuery {
    public static let operationName: String = "GetEpisode"
    public static let document: Apollo.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query GetEpisode($id: ID!) {
          episode(id: $id) {
            __typename
            ...EpisodeFragment
            characters {
              __typename
              ...CharacterFragment
            }
          }
        }
        """#,
        fragments: [EpisodeFragment.self, CharacterFragment.self, LocationFragment.self]
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
        .field("episode", Episode?.self, arguments: ["id": .variable("id")]),
      ] }

      /// Get a specific episode by ID
      public var episode: Episode? { __data["episode"] }

      /// Episode
      ///
      /// Parent Type: `Episode`
      public struct Episode: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { API.Objects.Episode }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("characters", [Character?].self),
          .fragment(EpisodeFragment.self),
        ] }

        /// List of characters who have been seen in the episode.
        public var characters: [Character?] { __data["characters"] }
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

        /// Episode.Character
        ///
        /// Parent Type: `Character`
        public struct Character: API.SelectionSet {
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

          /// Episode.Character.Location
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