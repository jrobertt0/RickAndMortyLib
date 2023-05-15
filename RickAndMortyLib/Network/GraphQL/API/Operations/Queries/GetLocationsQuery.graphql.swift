// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public extension API {
  class GetLocationsQuery: GraphQLQuery {
    public static let operationName: String = "GetLocations"
    public static let document: Apollo.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query GetLocations($page: Int, $filter: FilterLocation) {
          locations(page: $page, filter: $filter) {
            __typename
            info {
              __typename
              pages
            }
            results {
              __typename
              ...LocationFragment
            }
          }
        }
        """#,
        fragments: [LocationFragment.self]
      ))

    public var page: GraphQLNullable<Int>
    public var filter: GraphQLNullable<FilterLocation>

    public init(
      page: GraphQLNullable<Int>,
      filter: GraphQLNullable<FilterLocation>
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
        .field("locations", Locations?.self, arguments: [
          "page": .variable("page"),
          "filter": .variable("filter")
        ]),
      ] }

      /// Get the list of all locations
      public var locations: Locations? { __data["locations"] }

      /// Locations
      ///
      /// Parent Type: `Locations`
      public struct Locations: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { API.Objects.Locations }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("info", Info?.self),
          .field("results", [Result?]?.self),
        ] }

        public var info: Info? { __data["info"] }
        public var results: [Result?]? { __data["results"] }

        /// Locations.Info
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

        /// Locations.Result
        ///
        /// Parent Type: `Location`
        public struct Result: API.SelectionSet {
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
  }

}