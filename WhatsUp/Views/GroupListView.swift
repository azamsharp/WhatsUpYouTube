//
//  GroupListView.swift
//  WhatsUp
//
//  Created by Mohammad Azam on 3/14/23.
//

import SwiftUI

struct GroupListView: View {
    
    let groups: [Group]
    
    var body: some View {
        List(groups) { group in
            
            NavigationLink {
                Text(group.subject)
            } label: {
                HStack {
                    Image(systemName: "person.2")
                    Text(group.subject)
                }
            }
        }
    }
}

struct GroupListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupListView(groups: [])
            
    }
}
