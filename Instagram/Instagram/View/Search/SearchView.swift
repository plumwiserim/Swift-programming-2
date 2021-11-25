//
//  SearchView.swift
//  Instagram
//
//  Created by Sangkon Han on 2021/09/30.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    @State var inSearchMode = false
    
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView {
            SearchBar(text: $searchText, isEditing: $inSearchMode).padding()
            
            ZStack {
                if inSearchMode {
                    UserListView(viewModel: viewModel)
                } else {
                    PostGridView()
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
