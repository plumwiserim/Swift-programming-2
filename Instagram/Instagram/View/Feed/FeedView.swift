//
//  FeedView.swift
//  Instagram
//
//  Created by SW_mac04 on 2021/09/30.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                ForEach(0..<10) { _ in
                FeedCell()
                }
            }.padding(.top)
        }
        //Text("FeedView")
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
