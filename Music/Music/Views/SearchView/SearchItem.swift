//
//  SearchItem.swift
//  Music
//
//  Created by Ruben Mimoun on 02/08/2021.
//

import SwiftUI
import Combine

struct SearchItem: View {
    
    var data : Datum
    var asyncImage = AsyncImage()
    @State var error : AsyncImage.AsyncImageStatus = .success
    @State var image : Image = Image(systemName: "camera.circle")
    
    var body: some View {

        VStack{
//            HStack{
//                Text(data.title ?? "")
//                    .font(.title2)
//                    .bold()
//                    .foregroundColor(.white)
//                Spacer()
//
//            }
//            .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            HStack(){

                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100 , height: 100, alignment: .center)
                        .overlay(RoundedRectangle(cornerRadius: 25.0).stroke().foregroundColor(.white))
                        .background(Color.red)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                        .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                        .padding(.leading)

                VStack(spacing : 0){
                    
                    HStack{
                        Text(data.title ?? "")
                            .font(.title2)
                            
                            .bold()
                            .foregroundColor(.white)
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                        Spacer()

                    }
                    .padding(.leading, 20)
                    
                    Text(data.artist?.name ?? "")
                        .font(.body)
                        .bold()
                        .foregroundColor(.white)
//                    Text(data.album?.title ?? "")
//                        .font(.body)
//                        .bold()
//                        .foregroundColor(.white)
//                    Text("\(data.duration ?? 0 / 60)" )
//                        .font(.body)
//                        .bold()
//                        .foregroundColor(.white)
//                    
                    
                }
                .padding(.leading)
                Spacer()
                
                
            }
            .frame(height: 120)

        }
        .onAppear{
            asyncImage.loadImage(url: data.album?.coverMedium ?? "")
        }
        .onReceive( asyncImage.$image, perform: { result in
            self.image = result
        })
        .background(Color(UIColor.darkGray).opacity(0.6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
//
//struct SearchItem_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchItem()
//
//    }
//}
