//
//  SelectedMusicItemView.swift
//  Music
//
//  Created by Ruben Mimoun on 02/08/2021.
//

import SwiftUI


struct TrackList : Identifiable {
    let id = UUID()
    let title  : String
}

struct SelectedMusicItemView: View {
    
    @ObservedObject var viewModel : MusicViewModel
    let data : Datum
    let asyncImage = AsyncImage()
    @State var image =  Image(systemName: "camera.fill")
    @State var presentingSheet : Bool =  false
    @State var tracks : Tracks?
    @State var previewUrl : String? = ""
    @State var animationAmount : CGFloat = 0
   // @State var selectedTrack
    
    

    init(song : Datum, musicViewModel : MusicViewModel) {
        self.data = song
        self.viewModel = musicViewModel
        
        UITableView.appearance().backgroundColor = .black
    }
    
    
    var body: some View {
        ZStack {
            
            Color.black.ignoresSafeArea()
            
            VStack{
                
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.red,lineWidth: 2)
                            .scaleEffect(animationAmount)
                            .opacity(Double(1.1 - animationAmount))
                            .animation(.easeOut(duration: 1)
                                .repeatForever(autoreverses: false)
                            )
                    )
                    .shadow(color: .red.opacity(0.5), radius: 10, x: 0.0, y: 0.0)
                    .onAppear(perform: {
                        animationAmount = 1.1
                    })
                    
                
                    HStack{
                        Text(data.title ?? "")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                    .padding(.leading)

                    HStack{
                        Text(data.artist?.name ?? "")
                            .font(.title3)
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                    .padding(.leading)
                    
                    HStack{
                        Text(data.album?.title ?? "")
                            .font(.title3)
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                    .padding(.leading)
                
                
                    
                    List{
                        if let tracks = self.tracks , let data =  tracks.data{
                            ForEach(data, id:\.id){ track  in
                                HStack{
                                    Text(track.title!)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        
                                        .bold()
                                    Spacer()
                                    Text("\(viewModel.getDuration(value: Double(track.duration!)))")
                                    Image(systemName: "play.fill")
                                    }
                                .onTapGesture {
                                    presentingSheet.toggle()
                                    previewUrl =  track.preview

                                    }
                                }
                            .listRowBackground(Color.black)
                        }

                        }
                    .foregroundColor(.red)
                        
                    
                }
            }
        .onAppear{
            asyncImage.loadImage(url: data.album?.coverXl ?? "")
            if let albums = data.album, let trackUrl = albums.tracklist{
                viewModel.getTracks(url: trackUrl)
            }
        }
        .onReceive(asyncImage.$image, perform: { result in
            self.image = result
        })
        .onReceive(viewModel.$tracks, perform: { result in
            self.tracks = result
        })
        .sheet(isPresented: $presentingSheet, content: {
            PlayerView(viewModel: viewModel, url: previewUrl!)
        })
        .accentColor(.white)
            
    }// body
        
            
    
}

struct SelectedMusicItemView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedMusicItemView(song: Datum(id: 0, readable: true, title: "Jhonny", titleShort: "Jh", titleVersion: "Johnny English", link: "www.google.com", duration: 120, rank: 8, explicitLyrics: true, explicitContentLyrics: 1, explicitContentCover: 1, preview: "www.preview.com", md5Image: "picsum.com", artist: Artist(id: 0, name: "Bob", link: "", picture: "paperplane", pictureSmall: "", pictureMedium: "", pictureBig: nil, pictureXl: nil, tracklist: nil, type: nil), album:DatumAlbum(id: 0, title: "Album", cover: "", coverSmall: "", coverMedium: "", coverBig: "", coverXl: "", md5Image: "", tracklist: "", type: nil), type: nil),musicViewModel: MusicViewModel())
    }
}
