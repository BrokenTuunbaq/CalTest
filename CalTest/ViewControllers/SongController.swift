import UIKit

class SongController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (RuntimeStorage.playList?.items[RuntimeStorage.selectedPlayList!].playlistItems.items.count)!
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongCell
        cell.songImage.sd_setImage(with: URL(string:(RuntimeStorage.playList?.items[RuntimeStorage.selectedPlayList!].playlistItems.items[indexPath.row].snippet.thumbnails.thumbnailsDefault.url)!), placeholderImage: UIImage())
        cell.songTitle.text = RuntimeStorage.playList?.items[RuntimeStorage.selectedPlayList!].playlistItems.items[indexPath.row].snippet.title

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        RuntimeStorage.selectedSong = indexPath.row
    }
}
