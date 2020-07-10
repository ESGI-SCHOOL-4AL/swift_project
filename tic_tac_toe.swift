class TicTacToe: Game {
  let name = "tictactoe"
  let description = "Un classique, le morpion"

  var over: Bool
  var board: [[Character]]
  var player: Character

  init() {
    over = false
    player = "X"
    board = [[" ", " ", " "],[" ", " ", " "],[" ", " ", " "]]
    reset()
  }

  func reset() {
    player = "X"
    board = [[" ", " ", " "],[" ", " ", " "],[" ", " ", " "]]
    over = false
  }

  func start() {
    drawTable()
    print("Joueur \(player), choisissez une case: (ligne colonne)")
  }

  func checkWin() -> (Bool, Character) {
    let verticalCheck = verticalWin()
    let horizontalCheck = horizontalWin()
    let diagonalCheck = diagonalWin()

    if(verticalCheck.0) {
      return verticalCheck
    }

    if(horizontalCheck.0) {
      return horizontalCheck
    }

    if(diagonalCheck.0) {
      return diagonalCheck
    }
    
    return (false, "X")
  }

  func verticalWin() -> (Bool, Character) {
    var checkedX = 0;
    var checkedO = 0;

    for x in 0...2 {
      for y in 0...2 {
        if(board[x][y] == "X") {
          checkedX += 1
        }else {
          checkedX = 0
        }

        if(board[x][y] == "O") {
          checkedO += 1
        }else {
          checkedO = 0
        }
      }

      if(checkedX == 3) {
        return (true, "X")
      }

      if(checkedO == 3) {
        return (true, "O")
      }
      
    }

    return (false, "X")
  }

  func horizontalWin() -> (Bool, Character) {
    var checkedX = 0;
    var checkedO = 0;
    
    for x in 0...2 {
      for y in 0...2 {
        if(board[y][x] == "X") {
          checkedX += 1
        }else {
          checkedX = 0
        }

        if(board[y][x] == "O") {
          checkedO += 1
        }else {
          checkedO = 0
        }
      }

      if(checkedX == 3) {
        return (true, "X")
      }

      if(checkedO == 3) {
        return (true, "O")
      }
    }
    return (false, "X")
  }

  func diagonalWin() -> (Bool, Character) {
    var checkedX = 0;
    var checkedO = 0;

    for x in 0...2 {
      if(board[x][x] == "X") {
        checkedX += 1 
      }else {
        checkedX = 0
      }

      if(board[x][x] == "O") {
        checkedO += 1 
      }else {
        checkedO = 0
      }
    }
    
    if(checkedX == 3) {
        return (true, "X")
      }

    if(checkedO == 3) {
      return (true, "O")
    }  
  
    return (false, "X")
  }

  func stop() {
    over = true
  }

  func isOver() -> Bool {
    return over
  }

  func onCommand(command: String, args: [String]) -> Bool {
    if args.count != 1 {
      return false
    }

    do {
      let row = try read_numeric_input(command)
      let col = try read_numeric_input(args[0])
      
      if (row < 0 || row >= board.count || col < 0 || col >= board.count) {
        print("Veuillez saisir des nombres entiers valides compris entre 0 et \(board.count-1)")
        return true
      }

      if (board[row][col] != " ") {
        print("Cette case a déjà été jouée")
        return true
      }
      board[row][col] = player
    } catch {
      print("Veuillez saisir des nombres entiers valides compris entre 0 et \(board.count-1)")
      return true
    } 

    let win = checkWin()
    drawTable()
    if (!win.0) {
      player = (player == "X" ? "O": "X")
      print("Joueur \(player), choisissez une case: (ligne colonne)")
    } else {
      print("Le joueur \(win.1) a gagné !")
      over = true
    }
    
    return true
  }

  func drawTable() {
    drawTop()
    for (i, row) in board.enumerated() {
      print("│", terminator:"")
      for col in row {
        print(col, terminator:"│")
      }
      print()
      if (i != board.count - 1) {
        drawMiddleBoundary()
      }
    }
    drawBottom()
  }

  func drawBoundary(_ s: String, _ e: String, _ m: String, _ m2: String) {
    /* count = 3
      ┌─┬─┬─┐
      │ │X│O│
      ├─┼─┼─┤
      │ │O│ │
      ├─┼─┼─┤
      │O│ │ │
      └─┴─┴─┘
    */
    print(s, terminator:"")
    for _ in 0..<board.count-1 {
      print(m, terminator:m2)
    }
    print(m, terminator:e)
    print()
  }

  func drawTop() {
    drawBoundary("┌", "┐", "─", "┬")
  }

  func drawMiddleBoundary() {
    drawBoundary("├", "┤", "─", "┼")
  }

  func drawBottom() {
    drawBoundary("└", "┘", "─", "┴")
  }


}