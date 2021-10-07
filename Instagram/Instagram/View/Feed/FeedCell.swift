//
//  FeedCell.swift
//  Instagram
//
//  Created by SW_mac04 on 2021/09/30.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            //Profile
            HStack {
                Image("user")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipped()
                    .cornerRadius(18)
                Text("do0_nct")
                    .font(.system(size:14, weight:.semibold))
            }.padding([.leading, .bottom], 8)
            
            // Post Image
            Image("postimage")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 440)
                .clipped()
            
            // Icon Image, Interaction
            HStack(spacing: 16) {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
            }.padding([.top, .leading, .bottom], 8)
            .foregroundColor(.black)
            
            // Caption
            
            Text("3 likes")
                .font(.system(size:14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            HStack {
                Text("do0_nct").font(.system(size:14, weight: .semibold)) + Text(" 뮤지컬 마리앙투아네트 악셀 폰 페르젠 역 ").font(.system(size:15))
            }.padding(.leading, 8)
            
            // post-day
            Text("2d")
                .font(.system(size:14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top, -2)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
