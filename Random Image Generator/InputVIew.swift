//
//  InputVIew.swift
//  Random Image Generator
//
//  Created by Irfandi on 27/02/21.
//

import SwiftUI

struct InputVIew: View {
    let UIHeight = UIScreen.main.bounds.height
    let UIWidth = UIScreen.main.bounds.width
    
    @StateObject var VM = GenerateViewModel()
    
    var body: some View {
        NavigationView{
        ZStack{
            BackgroundView(TopColor: Color.white, BottomColor: Color.gray)
            VStack(alignment: .leading, spacing: 10){
                Spacer()
                
                Text("Caption : ")
                
                CaptionView(captions: $VM.message)
                
                BlurView(isBlur: $VM.isBlur)
               
                BWView(isBW: $VM.isBW)
                
                Spacer()
                
                Button{
                    VM.generateLink()

                } label: {
                    ButtonLabel(title: "Generate Gambar")
                }

                NavigationLink(destination: ContentView()) {
                    ButtonLabel(title: "Lihat Hasil")
                }
                
            } .padding()
        }
      }
        .environmentObject(VM)
    }
}

struct InputVIew_Previews: PreviewProvider {
    static var previews: some View {
        InputVIew()
    }
}

struct BackgroundView: View {
    var TopColor : Color
    var BottomColor : Color
    
    var body: some View{
        LinearGradient(gradient: Gradient(colors: [TopColor, BottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CaptionView: View {
    @Binding var captions : String
    var body: some View {
        TextField("Masukkan caption", text: $captions)
            .padding()
            .frame(width: UIWidth / 1.1, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.white)
            .cornerRadius(10)
    }
}

struct BlurView: View {
    @Binding var isBlur : Bool
    var body: some View {
        Toggle("Gambar Blur", isOn: $isBlur)
            .padding()
            .frame(width: UIWidth / 1.1, height: 50, alignment: .center)
            .background(Color.white)
            .cornerRadius(10)
    }
}

struct BWView: View {
    @Binding var isBW : Bool
    var body: some View {
        Toggle("Gambar Hitam Putih", isOn: $isBW)
            .padding()
            .frame(width: UIWidth / 1.1, height: 50, alignment: .center)
            .background(Color.white)
            .cornerRadius(10)
    }
}

struct ButtonLabel: View {
    var title : String
    
    var body: some View {
        Text(title)
            .padding()
            .frame(width: UIWidth / 1.1, height: 50, alignment: .center)
            .background(Color.white)
            .cornerRadius(10)
    }
}
