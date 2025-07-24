//
//  ProfileView.swift
//  Applyou
//
//  Created by Eduardo Ruiz-Garay on 7/22/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    init() {
        
    }
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    //avatar
                    Image(systemName: "person.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color.blue).frame(width: 100, height: 100)
                    // info
                    VStack(alignment: .leading){
                        HStack {
                            Text("Name:").bold()
                            Text(user.name)
                        }.padding()
                        HStack {
                            Text("Email:").bold()
                            Text(user.email)
                        }.padding()
                        HStack {
                            Text("Member Since:").bold()
                            Text("\(Date(timeIntervalSince1970: TimeInterval(user.joined)))")
                        }.padding()
                    }
                    //signout
                    Button("Log Out") {
                        viewModel.logout()
                    }.tint(Color.red)
                        .padding()
                } else {
                    Text("Loading...")
                }
            }
            .navigationTitle("Profile")
            
            .onAppear() {
                viewModel.fetchUser()
            }
            
        }
    }
}

#Preview {
    ProfileView()
}
