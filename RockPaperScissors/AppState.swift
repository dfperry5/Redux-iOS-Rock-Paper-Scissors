import Combine
import SwiftUI

class AppState: ObservableObject {
  
  @Published
  var gameStarted: Bool = true
  
  var didWin: Bool = false
  
  var isDraw: Bool = false
  
  var playerMove: Weapon = .Rock
  
  var computerMove: Weapon = .Rock
}

extension AppState {
  static let weapons: [Weapon] = [.Rock, .Paper, .Scissors]
}
