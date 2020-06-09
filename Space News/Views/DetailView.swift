//
//  DetailView.swift
//  Space News
//
//  Created by Jade Kim on 5/12/20.
//  Copyright © 2020 Jade Kim. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://example_URL")
    }
}

