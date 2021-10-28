//
//  PostGridView.swift
//  Instagram
//
//  Created by SW_mac04 on 2021/10/28.
//

import SwiftUI

struct PostGridView: View {
    
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2, content: {
            ForEach(0 ..< 10) { _ in
                NavigationLink(
                    destination: {
                        
                    }, label: {
                        Image("postimage")
                            .resizable()
                            .scaledToFill()
                            .frame(width: width, height: width)
                            .clipped()
                    })
                
            }
        })
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
