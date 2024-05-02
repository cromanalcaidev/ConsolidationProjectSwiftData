//
//  ContentView.swift
//  ConsolidationProjectSwiftData
//
//  Created by Carlos Román Alcaide on 2/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var userList = [User]()
    
    var body: some View {
        VStack {
            List (userList, id: \.id) { item in
                Text(item.name)
            }
        }
        .padding()
        .task {
            await loadUsers()
            print(userList)
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
            
            if let decodedResponse = try? decoder.decode(Users.self, from: data) {
                print(decodedResponse.userList.count)
                userList = decodedResponse.userList
            }
        } catch {
            print("Invalid data")
        }
    }
    
}

#Preview {
    ContentView()
}
