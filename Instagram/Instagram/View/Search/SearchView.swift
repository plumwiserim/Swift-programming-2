//
//  SearchView.swift
//  Instagram
//
//  Created by SW_mac04 on 2021/09/30.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    @State var inSearchMode = false
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText, isEditing: $inSearchMode).padding()
            
            ZStack {
                if inSearchMode {
                    UserListView()
                } else {
                    PostGridView()
                }
            }
        }
    }
}
