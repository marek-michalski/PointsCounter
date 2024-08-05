//
//  Navigation.swift
//  PointsCounter
//
//  Created by Marek Michalski on 11/06/2024.
//

import SwiftUI

struct Player: Identifiable {
    let id = UUID()
    var name: String
    var points: Int
}

struct Navigation: View {
    @State private var players = [
        Player(name: "Marek", points: 0),
    ]
    //    @State private var players: [Player] = []
    @State private var newPlayerName = ""
    @State private var showAddPlayer = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach($players) { $player in
                        HStack {
                            Text(player.name)
                                .bold()
                                .font(.title)
                                .onTapGesture {
                                    player.points += 10
                                }
                            Stepper("\(player.points) pkt", value: $player.points, step: 1)
                                .font(.title)
                            
                        }
                    }
                    .onDelete { players.remove(atOffsets: $0) }
                    .onMove { players.move(fromOffsets: $0, toOffset: $1) }
                }
            }
            .buttonStyle(PlainButtonStyle())
            .navigationBarTitle("Gracze")
            .toolbar {
                EditButton()
            }
            .navigationBarItems(
                leading: Button(action: {
                    for index in players.indices {
                        players[index].points = 0
                    }
                }) {
                    Text("Reset")
                        .foregroundColor(.red)
                },
                trailing: Button(action: {
                    showAddPlayer = true
                }) {
                    Image(systemName: "person.crop.circle.badge.plus")
                        .imageScale(.large)
                }
            )
            .sheet(isPresented: $showAddPlayer) {
                VStack {
                    Image("Friends")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    TextField("Podaj imię gracza...", text: $newPlayerName)
                        .padding()
                        .font(.title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    HStack {
                        Button(action: {
                            showAddPlayer = false
                        }) {
                            Text("Anuluj")
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        }
                        Button(action: {
                            if !newPlayerName.isEmpty {
                                players.append(Player(name: newPlayerName, points: 0))
                                newPlayerName = ""
                                showAddPlayer = false
                            }
                        }) {
                            Text("Dodaj")
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        }
                    }
                    
                }
                .padding()
            }
        }
    }
}

#Preview {
    Navigation()
}

