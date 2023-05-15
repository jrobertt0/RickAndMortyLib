// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public extension API {
  struct CharacterFragment: API.SelectionSet, Fragment {
    public static var fragmentDefinition: StaticString { """
      fragment CharacterFragment on Character {
        __typename
        id
        name
        gender
        species
        status
        image
        location {
          __typename
          ...LocationFragment
        }
      }
      """ }

    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { API.Objects.Character }
    public static var __selections: [Apollo.Selection] { [
      .field("__typename", String.self),
      .field("id", API.ID?.self),
      .field("name", String?.self),
      .field("gender", String?.self),
      .field("species", String?.self),
      .field("status", String?.self),
      .field("image", String?.self),
      .field("location", Location?.self),
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

    /// Location
    ///
    /// Parent Type: `Location`
    public struct Location: API.SelectionSet {
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
  }

}