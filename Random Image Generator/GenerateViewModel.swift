//
//  GenerateViewModel.swift
//  Random Image Generator
//
//  Created by Irfandi on 27/02/21.
//
import SwiftUI

class GenerateViewModel: ObservableObject {
    @Published var message = ""
    @Published var imageURL = "https://picsum.photos/1080/1920?grayscale"
    @Published var isBlur: Bool = false
    @Published var isBW: Bool = true
    
    var randomInt = 0
    
    func fillCaption(Caption: String){
        self.message = Caption
    }
    
    func fillURL(URL: String){
        self.imageURL = URL
    }
    
    func generateLink(){
        randomInt = Int.random(in: 0..<1080)
        
        var params = ""

        if(isBW){
            params += "?grayscale"
            if(isBlur){
                params += "&blur=5"
            }
        } else {
            if(isBlur){
                params += "?blur=5"
            }
        }
        
        let url = "https://picsum.photos/id/" + String(randomInt) + "/1080/1920" + params
        imageURL = url
        
    }
}
