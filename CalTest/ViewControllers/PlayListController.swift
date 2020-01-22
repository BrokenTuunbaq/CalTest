import UIKit
import SDWebImage

class PlayListController: UITableViewController, NetworkManagerDelegate {
        
    var networkManager = NetworkManager(playListUrl: StringConstant.playListUrl)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.delegate = self
        networkManager.requestPlayList()
    }
    
    func receivedPlayList(playList: PlayList) {
        RuntimeStorage.playList = playList
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard RuntimeStorage.playList != nil else {
            return 0
        }
        return RuntimeStorage.playList!.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongCell
        cell.songImage.sd_setImage(with: URL(string:(RuntimeStorage.playList?.items[indexPath.row].snippet.thumbnails.thumbnailsDefault.url)!), placeholderImage: UIImage())
        cell.songTitle.text = RuntimeStorage.playList?.items[indexPath.row].snippet.title

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        RuntimeStorage.selectedPlayList = indexPath.row
    }
}
