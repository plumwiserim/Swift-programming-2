//
//  MainTabView.swift
//  Instagram
//
//  Created by SW_mac04 on 2021/09/30.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        NavigationView {
            TabView {
                FeedView().tabItem{
                    Image(systemName: "house")
                    
                }
                SearchView().tabItem{
                    Image(systemName: "magnifyingglass")
                    
                }
                UploadPostView().tabItem{
                    Image(systemName: "plus.square")
                    
                }
                NotificationsView().tabItem{
                    Image(systemName: "heart")
                    
                }
                ProfileView().tabItem{
                    Image(systemName: "person")
                    
                }
            }
            .navigationTitle("Instagram")
            .navigationBarTitleDisplayMode(.inline)
            .accentColor(.black)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
