//
//  UserListView.swift
//  Instagram
//
//  Created by Sangkon Han on 2021/10/25.
//

import SwiftUI

struct UserListView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach (viewModel.users) { user in
                    NavigationLink(destination: ProfileView(), label: {
                        UserCell(user: user).padding(.leading)
                    })                    
                }
            }
        }
    }
}
