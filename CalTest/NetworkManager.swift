import Foundation

protocol NetworkManagerDelegate {
    func receivedPlayList(playList: PlayList)
}

//Network class responsible to receive data from request
struct NetworkManager {
    
    let playListUrl: String
    var delegate: NetworkManagerDelegate?
    
    func requestPlayList() {
        let url = URL(string: playListUrl)!
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
            
            let decoder = JSONDecoder()
            do {
                let playList = try decoder.decode(PlayList.self, from: data)
                self.delegate?.receivedPlayList(playList: playList)
            }
            catch {
                print("Error: did not receive any songs")
            }
        }
        task.resume()
    }
    
    init(playListUrl: String) {
        self.playListUrl = playListUrl
    }
}
