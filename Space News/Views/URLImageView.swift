//
//  URLImageView.swift
//  Space News
//
//  Created by Jade Kim on 5/13/20.
//  Copyright © 2020 Jade Kim. All rights reserved.
//

import SwiftUI

struct URLImageView: View {
    
    @ObservedObject private var imageLoader: ImageLoader
    
    public init(imageURL: URL?) {
        imageLoader = ImageLoader(resourseURL: imageURL)
    }
    
    public var body: some View {
        if let uiImage = UIImage(data: self.imageLoader.data) {
            return AnyView(Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: ContentMode.fit))
            
        } else {
            return AnyView(Image(systemName: "ellipsis")
                .onAppear(perform: { self.imageLoader.loadImage() }))
        }
    }
}

struct URLImageView_Previews: PreviewProvider {
    static var previews: some View {
        URLImageView(imageURL: URL(string: "placeholder URL"))
    }
}
