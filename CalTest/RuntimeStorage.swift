import Foundation

//Storage struct saves playlist received from network request
struct RuntimeStorage {
    static var playList: PlayList?
    static var selectedPlayList: Int?
    static var selectedSong: Int?
}
