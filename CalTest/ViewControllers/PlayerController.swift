import UIKit
import AVFoundation
import YoutubePlayer_in_WKWebView

class PlayerController: UIViewController, WKYTPlayerViewDelegate {

    @IBOutlet weak var playerView: WKYTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerView.delegate = self
        
        let videoId = (RuntimeStorage.playList?.items[RuntimeStorage.selectedPlayList!].playlistItems.items[RuntimeStorage.selectedSong!].snippet.resourceID.videoID)!
        self.playerView.load(withVideoId: videoId)
    }
    
    func playerViewDidBecomeReady(_ playerView: WKYTPlayerView) {
        self.playerView.playVideo()
    }
}
