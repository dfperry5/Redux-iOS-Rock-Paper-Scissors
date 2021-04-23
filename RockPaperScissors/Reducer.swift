struct Reducer {
  static func update(action: Actions, state: AppState) {
    switch action {
    case .newGame:
      startNewGame(state: state)
    case let .playerMove(weapon):
      updateUserMove(weapon: weapon, state: state)
    }
  }
}

extension Reducer {
  private static func updateUserMove(weapon: Weapon, state: AppState) {
    state.playerMove = weapon
    let computerMoveIdx = Int.random(in: 0..<3)
    let computerMove = AppState.weapons[computerMoveIdx]
    state.computerMove = computerMove
    switch weapon {
    case .Rock:
      switch computerMove {
      
      case .Rock:
        state.didWin = false
        state.isDraw = true
        state.gameStarted = false
        
      case .Paper:
        state.didWin = false
        state.isDraw = false
        state.gameStarted = false

      case .Scissors:
        state.didWin = true
        state.isDraw = false
        state.gameStarted = false

      }
      
    case .Paper:
      switch computerMove {
      
      case .Rock:
        state.didWin = true
        state.isDraw = false
        state.gameStarted = false
        
      case .Paper:
        state.didWin = false
        state.isDraw = true
        state.gameStarted = false

      case .Scissors:
        state.didWin = true
        state.isDraw = false
        state.gameStarted = false

      }
      
    case .Scissors:
      switch computerMove {
      
      case .Rock:
        state.isDraw = false
        state.didWin = false
        state.gameStarted = false
        
      case .Paper:
        state.isDraw = false
        state.didWin = true
        state.gameStarted = false

      case .Scissors:
        state.isDraw = true
        state.didWin = false
        state.gameStarted = false
      }
    }
  }
  
  private static func startNewGame(state: AppState) {
    state.gameStarted = true
  }
}
