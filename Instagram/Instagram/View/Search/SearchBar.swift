//
//  SearchBar.swift
//  Instagram
//
//  Created by SW_mac04 on 2021/10/07.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @Binding var isEditing : Bool
    
    var body: some View {
        // 돋보기 입력창
        HStack {
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                ).onTapGesture {
                    isEditing = true
                }
            if isEditing {
                Button(action: {
                    isEditing = false
                    text = ""
                    UIApplication.shared.endEditing()
                }, label: {
                    Text("Cancle").foregroundColor(.black)
                })
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}
