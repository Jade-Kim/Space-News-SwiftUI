//
//  ContentView.swift
//  Space News
//
//  Created by Jade Kim on 5/12/20.
//  Copyright © 2020 Jade Kim. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        
        NavigationView {
            // For Loop in List
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    VStack {
                        URLImageView(imageURL: URL(string: post.featured_image))
                        Text(post.title)
                    }
                }
            }
            // NavigationView
            .navigationBarTitle("Space NEWS")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
