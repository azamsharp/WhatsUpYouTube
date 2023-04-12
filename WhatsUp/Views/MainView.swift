//
//  MainView.swift
//  WhatsUp
//
//  Created by Mohammad Azam on 3/13/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            GroupListContainerView()
               
                .tabItem {
                    Label("Chats", systemImage: "message.fill")
                }
            
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
