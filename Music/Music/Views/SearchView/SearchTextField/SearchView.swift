//
//  SearchView.swift
//  Music
//
//  Created by Ruben Mimoun on 02/08/2021.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var searchObserver : MusicViewModel
    
    var body: some View {
        
        HStack {
            
            Image(systemName: "magnifyingglass.circle")
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .overlay(Circle().stroke().foregroundColor(.white))
                .clipShape(Circle())
                .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0))
            
            GeometryReader{geo  in
                let width =  geo.size.width
                
                CustomTextField(textObserver: searchObserver)
                    .frame(width: width)
                    .onChange(of: searchObserver.text, perform: { value in
                        print(value)
                })
                
            }
            .frame(height: 40)
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.pink, Color.purple, Color.blue]), startPoint: .leading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 1.0).foregroundColor(.white))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: .blue, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
      
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchObserver: MusicViewModel())
    }
}
