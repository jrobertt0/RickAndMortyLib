// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public extension API {
  struct LocationFragment: API.SelectionSet, Fragment {
    public static var fragmentDefinition: StaticString { """
      fragment LocationFragment on Location {
        __typename
        id
        dimension
        name
      }
      """ }

    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { API.Objects.Location }
    public static var __selections: [Apollo.Selection] { [
      .field("__typename", String.self),
      .field("id", API.ID?.self),
      .field("dimension", String?.self),
      .field("name", String?.self),
    ] }

    /// The id of the location.
    public var id: API.ID? { __data["id"] }
    /// The dimension in which the location is located.
    public var dimension: String? { __data["dimension"] }
    /// The name of the location.
    public var name: String? { __data["name"] }
  }

}