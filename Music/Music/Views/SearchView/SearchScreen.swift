//
//  SearchScreen.swift
//  Music
//
//  Created by Ruben Mimoun on 02/08/2021.
//

import SwiftUI



struct SearchScreen: View {

    let searchViewModel = MusicViewModel()
    @State var dataSearched : Bool = false
    @State var data : [Datum] = []
    @State var selected : Data?
    @State var isPresentingSheet : Bool = false
    
    init() {
        UITableView.appearance().backgroundColor = .black // Uses UIColor
        UITableViewCell.appearance().selectionStyle = .none
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor:UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor:UIColor.white]
    }
    

    var body: some View {

          
        NavigationView{
            ZStack {
                Color.black
                    .ignoresSafeArea()

                VStack{
                    SearchView(searchObserver: searchViewModel)
                    if data.count != 0 {
                        List{
                           ForEach(data, id: \.id) { datum in
                            NavigationLink(destination: SelectedMusicItemView(song: datum, musicViewModel: searchViewModel)) {
                                SearchItem(data: datum)
                                    .transition(.moveAndScale(edge: .leading))
                                }
                            
                            }
         
                            .lineSpacing(10.0)
                            .listRowBackground(Color.black)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .listRowBackground(Color.black)
                        .edgesIgnoringSafeArea(.all)

                        
                    }else{
                        Color.black.ignoresSafeArea()
                    }
                }
                .background(Color.black)
                .onReceive(searchViewModel.$search, perform: { search in
                    print("received data")
                    if let search = search , let result =  search.data{
                        self.data = result
                    }
                    
                })
                .padding()
                .navigationBarTitle("Search")

            }
        }
        .accentColor(.white)


            
    }//body
    
        
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
extension AnyTransition {
    static func moveAndScale(edge: Edge) -> AnyTransition {
        AnyTransition.move(edge: edge).combined(with: .scale(scale: 1))
    }
}
