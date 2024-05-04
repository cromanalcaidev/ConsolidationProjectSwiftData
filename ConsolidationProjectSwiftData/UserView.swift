//
//  UserView.swift
//  ConsolidationProjectSwiftData
//
//  Created by Carlos Román Alcaide on 3/5/24.
//

import SwiftUI

struct UserView: View {
//    var users = Users()
    var user: User
    @State private var chosenFriend = ""
    
    
    var body: some View {
        ScrollView {
            VStack {
                Section(header: Text("Name and age")) {
                    Divider()
                        .frame(width: 120)
                    
                    Text("\(user.name), \(user.age)")
                        .font(.title)
                        
                }
                
                Spacer(minLength: 40)
                
                Section(header: Text("Bio")) {
                    Divider()
                        .frame(width: 30)
                    
                    Text(user.about)
                        .font(.system(size: 22))
                        
                }
                .padding(.horizontal, 10)
                
                Spacer(minLength: 40)
                
                Section(header: Text("Friends")) {
                    Divider()
                        .frame(width: 60)
                    
                    ForEach(user.friends) { friend in
                        Text(friend.name)
                            .font(.system(size: 20))
                            .padding(.vertical, 2)
                            
                    }
                }
            }
        }
    }
}

//#Preview {
//    UserView()
//}
