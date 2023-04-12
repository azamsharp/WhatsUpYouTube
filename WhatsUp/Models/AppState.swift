//
//  AppState.swift
//  WhatsUp
//
//  Created by Mohammad Azam on 3/13/23.
//

import Foundation
 
enum Route: Hashable {
    case main
    case login
    case signUp
}

class AppState: ObservableObject {
    @Published var routes: [Route] = []
}
