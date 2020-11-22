//
//  PostView.swift
//  Catstagram-starter
//
//  Created by Vania Radmila Alfitri on 22/11/20.
//

import SwiftUI

struct PostView: View {
    @ObservedObject var imageLoader = ImageLoader()
    var feed: Feed
    
    var body: some View {
        VStack {
            HStack {
                Image("")
                Text("Jane Doe")
            }
            
            Image("")
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
