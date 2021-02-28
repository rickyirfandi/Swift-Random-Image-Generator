//
//  ContentView.swift
//  Random Image Generator
//
//  Created by Irfandi on 27/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

let UIHeight = UIScreen.main.bounds.height
let UIWidth = UIScreen.main.bounds.width

struct ContentView: View {
    
    @EnvironmentObject var VM : GenerateViewModel
    
    var body: some View {
        ZStack {
            BackgroundImage(url: VM.imageURL)
            
            Caption(capt: $VM.message)
//            Caption(capt: VM.imageURL)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Caption: View {
    @Binding var capt: String
    
    var body: some View {
        Text(capt)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .padding()
            .foregroundColor(.yellow)
            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
    }
}

struct BackgroundImage: View {
    var url: String
    
    var body: some View {
        WebImage(url: URL(string: url))
            .resizable()
            .frame(width: UIWidth, height: UIHeight + 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .edgesIgnoringSafeArea(.all)
    }
}
