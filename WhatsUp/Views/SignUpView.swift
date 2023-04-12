//
//  SignUpView.swift
//  WhatsUp
//
//  Created by Mohammad Azam on 3/13/23.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var displayName: String = ""
    @State private var errorMessage: String = ""
    
    @EnvironmentObject private var model: Model
    @EnvironmentObject private var appState: AppState
    
    private var isFormValid: Bool {
        !email.isEmptyOrWhiteSpace && !password.isEmptyOrWhiteSpace && !displayName.isEmptyOrWhiteSpace
    }
    
    private func signUp() async {
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            try await model.updateDisplayName(for: result.user, displayName: displayName)
        } catch {
            errorMessage = error.localizedDescription
        }
        
    }
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
                .textInputAutocapitalization(.never)
            TextField("Display name", text: $displayName)
            
            HStack {
                Spacer()
                Button("SignUp") {
                    Task {
                       await signUp()
                    }
                }.disabled(!isFormValid)
                    .buttonStyle(.borderless)
                
                Button("Login") {
                    appState.routes.append(.login)
                }.buttonStyle(.borderless)
                Spacer()
            }
            
            Text(errorMessage)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(Model())
            .environmentObject(AppState())
    }
}
