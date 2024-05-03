//
//  UserView.swift
//  ConsolidationProjectSwiftData
//
//  Created by Carlos Román Alcaide on 3/5/24.
//

import SwiftUI

struct UserView: View {
    var users = Users()
    var chosenNumber: Int
    
    var body: some View {
        VStack {
            ForEach(users.userList, id: \.id) { item in
            Text(item.address)
            }
        }
    }
    
//    func loadUsers() async {
//        let endpoint = "https://www.hackingwithswift.com/samples/friendface.json"
//        guard let url = URL(string: endpoint) else {
//            print("Invalid URL")
//            return
//        }
//        
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let decoder = JSONDecoder()
//            decoder.dateDecodingStrategy = .iso8601
//            
//            if let decodedResponse = try? decoder.decode([User].self, from: data) {
//                userList = decodedResponse
//                users.userList = decodedResponse
//            }
//        } catch {
//            print("Invalid data")
//        }
//    }
}

#Preview {
    UserView(chosenNumber: 0)
}
