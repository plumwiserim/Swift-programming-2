//
//  UserListView.swift
//  Instagram
//
//  Created by SW_mac04 on 2021/10/28.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach ( 0 ..< 20) { _ in
                    NavigationLink(destination: {
                            ProfileView()
                        },
                        label: {
                            UserCell().padding(.leading)
                        })
                }
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
