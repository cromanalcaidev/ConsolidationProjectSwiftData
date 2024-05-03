//
//  ContentView.swift
//  ConsolidationProjectSwiftData
//
//  Created by Carlos Román Alcaide on 2/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var userList = [User]()
    @State private var path = [User]()
    @State private var users = Users()
    
    var body: some View {
        NavigationStack {
            List (users.userList, id: \.id) { user in
                    HStack {
                        NavigationLink(user.name) {
                            UserView(chosenNumber: users.userList.firstIndex(of: user) ?? 0)
                        }
                        
                        Spacer()
                        
                        user.isActive ? Image(systemName: "star.fill") : Image(systemName: "star.slash")
                    }
            }
            .navigationTitle("Contacts")
            .navigationDestination(for: User.self) { user in
                UserView(chosenNumber: users.userList.firstIndex(of: user) ?? 0)
                Text("You selected \(user)")
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
                userList = decodedResponse
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
