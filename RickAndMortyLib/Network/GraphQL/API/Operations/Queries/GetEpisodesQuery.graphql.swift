// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public extension API {
  class GetEpisodesQuery: GraphQLQuery {
    public static let operationName: String = "GetEpisodes"
    public static let document: Apollo.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query GetEpisodes($page: Int, $filter: FilterEpisode) {
          episodes(page: $page, filter: $filter) {
            __typename
            info {
              __typename
              pages
            }
            results {
              __typename
              ...EpisodeFragment
            }
          }
        }
        """#,
        fragments: [EpisodeFragment.self]
      ))

    public var page: GraphQLNullable<Int>
    public var filter: GraphQLNullable<FilterEpisode>

    public init(
      page: GraphQLNullable<Int>,
      filter: GraphQLNullable<FilterEpisode>
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
        .field("episodes", Episodes?.self, arguments: [
          "page": .variable("page"),
          "filter": .variable("filter")
        ]),
      ] }

      /// Get the list of all episodes
      public var episodes: Episodes? { __data["episodes"] }

      /// Episodes
      ///
      /// Parent Type: `Episodes`
      public struct Episodes: API.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { API.Objects.Episodes }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("info", Info?.self),
          .field("results", [Result?]?.self),
        ] }

        public var info: Info? { __data["info"] }
        public var results: [Result?]? { __data["results"] }

        /// Episodes.Info
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

        /// Episodes.Result
        ///
        /// Parent Type: `Episode`
        public struct Result: API.SelectionSet {
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
      }
    }
  }

}