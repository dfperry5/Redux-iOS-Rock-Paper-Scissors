//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Dylan Perry on 4/22/21.
//

import SwiftUI

struct ContentView {
  @ObservedObject
  var state = AppState()
  
  var gameButtons: some View {
    HStack {
      Spacer()
      
      Button(Weapon.Rock.rawValue) {
        Reducer.update(action: .playerMove(Weapon.Rock), state: state)
      }
      .padding()
      
      Button(Weapon.Paper.rawValue) {
        Reducer.update(action: .playerMove(Weapon.Paper), state: state)
      }
      .padding()
      
      Button(Weapon.Scissors.rawValue) {
        Reducer.update(action: .playerMove(Weapon.Scissors), state: state)
      }
      .padding()
      
      Spacer()
    }
  }
  
  var restartButton: some View {
    Button("New Game"){
      Reducer.update(action: .newGame, state: state)
    }
  }
  
  var results: some View {
    VStack {
      HStack {
        Text("Your Move:")
          .bold()
          .padding()
        Spacer()
        Text(state.playerMove.rawValue)
          .padding()
      }
      .padding()
      
      HStack {
        Text("Computer Move: ")
          .bold()
          .padding()
        Spacer()
        Text(state.computerMove.rawValue)
          .padding()
      }
      
      if state.didWin {
        Text("TOTAL VICTORY!!!")
          .bold()
          .padding()
      } else if state.isDraw {
        Text("A Tie... BORING!")
          .bold()
          .padding()
      } else {
        Text("UTTER DEFEAT :(")
          .bold()
          .padding()
      }
    }
    .padding()
  }
  
  var yourMove: some View {
    Text("Choose your weapon!!")
      .padding()
  }
  
  
}
extension ContentView: View {
    var body: some View {
      VStack {
        Text("Rock, Paper, Scissors")
          .bold()
          .font(.title)
          .padding()
        
        Spacer()
        
        if state.gameStarted {
          yourMove
          gameButtons
        } else {
          results
          restartButton
        }
        
        Spacer()
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
