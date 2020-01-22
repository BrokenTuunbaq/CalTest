import Foundation

struct PlayList: Codable {
    let kind, etag: String
    let pageInfo: PageInfo
    let items: [PlayListItem]
}

struct PlayListItem: Codable {
    let kind: PurpleKind
    let etag, id: String
    let playlistItems: PlaylistItems
    let snippet: FluffySnippet
    let contentDetails: PurpleContentDetails
}

struct PurpleContentDetails: Codable {
    let itemCount: Int
}

enum PurpleKind: String, Codable {
    case youtubePlaylist = "youtube#playlist"
}

struct PlaylistItems: Codable {
    let kind: PlaylistItemsKind
    let etag: String
    let pageInfo: PageInfo
    let items: [PlaylistItemsItem]
    let nextPageToken: String?
}

struct PlaylistItemsItem: Codable {
    let kind: FluffyKind
    let etag, id: String
    let snippet: PurpleSnippet
    let contentDetails: FluffyContentDetails
}

struct FluffyContentDetails: Codable {
    let videoID, videoPublishedAt: String

    enum CodingKeys: String, CodingKey {
        case videoID = "videoId"
        case videoPublishedAt
    }
}

enum FluffyKind: String, Codable {
    case youtubePlaylistItem = "youtube#playlistItem"
}

struct PurpleSnippet: Codable {
    let publishedAt: String
    let channelID: ChannelID
    let title, snippetDescription: String
    let thumbnails: Thumbnails
    let channelTitle: ChannelTitle
    let playlistID: String
    let position: Int
    let resourceID: ResourceID

    enum CodingKeys: String, CodingKey {
        case publishedAt
        case channelID = "channelId"
        case title
        case snippetDescription = "description"
        case thumbnails, channelTitle
        case playlistID = "playlistId"
        case position
        case resourceID = "resourceId"
    }
}

enum ChannelID: String, Codable {
    case uCFM3ZsQsOnfWNUppiycmBuw = "UCfM3zsQsOnfWNUppiycmBuw"
}

enum ChannelTitle: String, Codable {
    case eminemMusic = "EminemMusic"
}

struct ResourceID: Codable {
    let kind: ResourceIDKind
    let videoID: String

    enum CodingKeys: String, CodingKey {
        case kind
        case videoID = "videoId"
    }
}

enum ResourceIDKind: String, Codable {
    case youtubeVideo = "youtube#video"
}

struct Thumbnails: Codable {
    let thumbnailsDefault, medium, high: Default
    let standard, maxres: Default?

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high, standard, maxres
    }
}

struct Default: Codable {
    let url: String
    let width, height: Int
}

enum PlaylistItemsKind: String, Codable {
    case youtubePlaylistItemListResponse = "youtube#playlistItemListResponse"
}

struct PageInfo: Codable {
    let totalResults, resultsPerPage: Int
}

struct FluffySnippet: Codable {
    let publishedAt: String
    let channelID: ChannelID
    let title, snippetDescription: String
    let thumbnails: Thumbnails
    let channelTitle: ChannelTitle
    let localized: Localized
    let tags: [String]?
    let defaultLanguage: String?

    enum CodingKeys: String, CodingKey {
        case publishedAt
        case channelID = "channelId"
        case title
        case snippetDescription = "description"
        case thumbnails, channelTitle, localized, tags, defaultLanguage
    }
}

struct Localized: Codable {
    let title, localizedDescription: String

    enum CodingKeys: String, CodingKey {
        case title
        case localizedDescription = "description"
    }
}
