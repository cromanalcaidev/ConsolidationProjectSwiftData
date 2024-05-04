//
//  ContentView.swift
//  ConsolidationProjectSwiftData
//
//  Created by Carlos Román Alcaide on 2/5/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {

    @State private var users = Users()
    
    var body: some View {
        NavigationStack {
        
            List (users.userList) { user in
                    HStack {
                        NavigationLink(value: user) {
                            Text("\(user.name)")
                            
                            Spacer()
                            
                            user.isActive ? Image(systemName: "star.fill") : Image(systemName: "star.slash")
                            
                        }
                    }
            }
            .navigationTitle("Contacts")
            .navigationDestination(for: User.self) { user in
                UserView(user: user)
            }
        }
        .padding()
        .task {
            await loadUsers()
        }
    }
    
    func loadUsers() async {
        let endpoint = "https://www.hackingwithswift.com/samples/friendface.json"
        guard let url = URL(string: endpoint) else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let decodedResponse = try? decoder.decode([User].self, from: data) {
                users.userList = decodedResponse
                
            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
}
