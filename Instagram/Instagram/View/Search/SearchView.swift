//
//  SearchView.swift
//  Instagram
//
//  Created by SW_mac04 on 2021/09/30.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    
    var body: some View {
        
        // 검색창, 검색버튼
        ScrollView {
            SearchBar(text: $searchText)
        }
        
        // 검색결과 => 그리드뷰 형태로 나와야 된다. 
        
        //Text("Search View")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
