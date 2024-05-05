//
//  ContentView.swift
//  ConsolidationProjectSwiftData
//
//  Created by Carlos Román Alcaide on 2/5/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \User.name) var users: [User]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users, id: \.id) { user in
                    HStack {
                        NavigationLink(value: user) {
                            Text("\(user.name)")
                            
                            Spacer()
                            
                            user.isActive ? Image(systemName: "star.fill") : Image(systemName: "star.slash")
                            
                        }
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
        
        guard users.isEmpty else { return }
        
        
        do {
            let endpoint = "https://www.hackingwithswift.com/samples/friendface.json"
            guard let url = URL(string: endpoint) else {
                print("Invalid URL")
                return
            }
        
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let decodedUsers = try decoder.decode([User].self, from: data)
            let insertContext = ModelContext(modelContext.container)
            //creamos otro contexto para que la carga sea más rápida y estéticamente agradable
            
            for user in decodedUsers {
//                modelContext.insert(user)
                insertContext.insert(user)
                //recurrimos a este método para hacer la inserción de datos
            }
            
            try insertContext.save()
            //sin este guardado, la UI no se actualizará con los datos del nuevo contexto
            
        } catch {
            print("Invalid data")
        }
    }
}

//#Preview {
//    ContentView()
//}
