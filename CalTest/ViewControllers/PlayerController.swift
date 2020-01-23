import UIKit
import AVFoundation
import YoutubePlayer_in_WKWebView

//Youtube Player ViewController class
class PlayerController: UIViewController, WKYTPlayerViewDelegate {

    @IBOutlet weak var playerView: WKYTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set delegate WKYTPlayerViewDelegate
        playerView.delegate = self
        
        let videoId = (RuntimeStorage.playList?.items[RuntimeStorage.selectedPlayList!].playlistItems.items[RuntimeStorage.selectedSong!].snippet.resourceID.videoID)!
        self.playerView.load(withVideoId: videoId)
    }
    
    //Method called when player is ready to start playing
    func playerViewDidBecomeReady(_ playerView: WKYTPlayerView) {
        self.playerView.playVideo()
    }
}
