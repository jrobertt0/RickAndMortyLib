// @generated
// This file was automatically generated and should not be edited.

import Apollo

public protocol API_SelectionSet: Apollo.SelectionSet & Apollo.RootSelectionSet
where Schema == API.SchemaMetadata {}

public protocol API_InlineFragment: Apollo.SelectionSet & Apollo.InlineFragment
where Schema == API.SchemaMetadata {}

public protocol API_MutableSelectionSet: Apollo.MutableRootSelectionSet
where Schema == API.SchemaMetadata {}

public protocol API_MutableInlineFragment: Apollo.MutableSelectionSet & Apollo.InlineFragment
where Schema == API.SchemaMetadata {}

public extension API {
  typealias ID = String

  typealias SelectionSet = API_SelectionSet

  typealias InlineFragment = API_InlineFragment

  typealias MutableSelectionSet = API_MutableSelectionSet

  typealias MutableInlineFragment = API_MutableInlineFragment

  enum SchemaMetadata: Apollo.SchemaMetadata {
    public static let configuration: Apollo.SchemaConfiguration.Type = SchemaConfiguration.self

    public static func objectType(forTypename typename: String) -> Object? {
      switch typename {
      case "Query": return API.Objects.Query
      case "Character": return API.Objects.Character
      case "Location": return API.Objects.Location
      case "Episode": return API.Objects.Episode
      case "Characters": return API.Objects.Characters
      case "Info": return API.Objects.Info
      case "Episodes": return API.Objects.Episodes
      case "Locations": return API.Objects.Locations
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}