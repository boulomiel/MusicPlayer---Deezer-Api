//
//  PlayerView.swift
//  Music
//
//  Created by Ruben Mimoun on 02/08/2021.
//

import SwiftUI
import AVFoundation

struct PlayerView: View {
    
    @ObservedObject var viewModel : MusicViewModel
    let url : String
    
    @State var audioPlayer = AVAudioPlayer()
    @State var isPlaying : Bool = false

    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            if let url = URL(string: url){
                WebView(url: url)
            }else{
                Text("Preview is unavailable")
                    .foregroundColor(.red)
            }
        }
        .onAppear{
            if let url = URL(string: url){
                viewModel.downloadPreview(url: url.absoluteString)
            }
        }
        .onReceive(viewModel.$previewUrl, perform: { url in
//            do {
//                if let url = url {
//                    self.audioPlayer = try AVAudioPlayer(contentsOf: url)
//                    audioPlayer.prepareToPlay()
//                    audioPlayer.volume = 1.0
//                    audioPlayer.play()
//                }
//              
//            } catch let error as NSError {
//                //self.audioPlayer = nil
//                print(error.localizedDescription)
//            } catch {
//                print("AVAudioPlayer init failed")
//            }
        })
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(viewModel: MusicViewModel(), url: "https://cdns-preview-f.dzcdn.net/stream/c-f9b2f67eaaab51020ac5283954d1f4b8-5.mp3")
    }
}
