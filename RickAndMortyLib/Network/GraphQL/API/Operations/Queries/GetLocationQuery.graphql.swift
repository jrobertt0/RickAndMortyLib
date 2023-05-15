// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public extension API {
  class GetLocationQuery: GraphQLQuery {
    public static let operationName: String = "GetLocation"
    public static let document: Apollo.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query GetLocation($id: ID!) {
          location(id: $id) {
            __typename
            ...LocationFragment
            residents {
              __typename
              ...CharacterFragment
            }
            type
          }
        }
        """#,
        fragments: [LocationFragment.self, CharacterFragment.self]
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
        .field("location", Location?.self, arguments: ["id": .variable("id")]),
      ] }

      /// Get a specific locations by ID
      public var location: Location? { __data["location"] }

      /// Location
      ///
      /// Parent Type: `Location`
      public struct Location: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { API.Objects.Location }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("residents", [Resident?].self),
          .field("type", String?.self),
          .fragment(LocationFragment.self),
        ] }

        /// List of characters who have been last seen in the location.
        public var residents: [Resident?] { __data["residents"] }
        /// The type of the location.
        public var type: String? { __data["type"] }
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

        /// Location.Resident
        ///
        /// Parent Type: `Character`
        public struct Resident: API.SelectionSet {
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

          /// Location.Resident.Location
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