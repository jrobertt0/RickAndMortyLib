// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public extension API {
  struct EpisodeFragment: API.SelectionSet, Fragment {
    public static var fragmentDefinition: StaticString { """
      fragment EpisodeFragment on Episode {
        __typename
        id
        name
        air_date
        episode
      }
      """ }

    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { API.Objects.Episode }
    public static var __selections: [Apollo.Selection] { [
      .field("__typename", String.self),
      .field("id", API.ID?.self),
      .field("name", String?.self),
      .field("air_date", String?.self),
      .field("episode", String?.self),
    ] }

    /// The id of the episode.
    public var id: API.ID? { __data["id"] }
    /// The name of the episode.
    public var name: String? { __data["name"] }
    /// The air date of the episode.
    public var air_date: String? { __data["air_date"] }
    /// The code of the episode.
    public var episode: String? { __data["episode"] }
  }

}