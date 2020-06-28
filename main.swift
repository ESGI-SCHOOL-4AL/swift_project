typealias commandFunc = (String, [String]) -> Bool

var is_ended: Bool = false
var commands = [String : commandFunc]()
var games = [Game]()
var currentGame: Game? = nil

func parseCommand(command: String) -> (name: String, args: [String]) {
  var arr = command.split(separator: " ").map{ String($0) }.filter{$0 != ""}
  var cmd = ""
  if (arr.count != 0) {
    cmd = arr[0]
    arr.removeFirst()
  }
  return (cmd, arr)
}

func listGames() {
  print("Sélectionnez un jeu")
  for game in games {
    print(game.name + " - " + game.description)
  }
  print("quit - Quitter le logiciel")
}

func setCurrentGame(game: Game) {
  currentGame = game
  if let unwrapped = currentGame {
    unwrapped.reset()
    unwrapped.start()
  }
}

commands["quit"] = {
  (name: String, args: [String]) -> Bool in
  print("Bye")
  is_ended = true
  return true
}

commands["stop"] = {
  (name: String, args: [String]) -> Bool in
  if let unwrapped = currentGame {
    unwrapped.stop()
  } else {
    listGames()
  }
  return true
}

games.append(Guess())

print("Bienvenue dans le projet Swift")
listGames()

while(!is_ended) {
  let command = parseCommand(command: readLine()!)
  if (command.name != "") {
    if let fun = commands[command.name] {
      if (!fun(command.name, command.args)) {
        print("Utilisation incorrecte")
      }
    } else if (currentGame == nil) {
      var found = false
      for game in games {
        if (game.name == command.name) {
          found = true
          setCurrentGame(game: game)
          break
        }
      }
      if !found {
        print("Commande inconnue")
      }
    } else if let unwrapped = currentGame {
      if(!unwrapped.onCommand(command: command.name, args: command.args)) {
        print("Commande inconnue")
      }
    }
  }

  if let unwrapped = currentGame {
    if (unwrapped.isOver()) {
      currentGame = nil
      listGames()
    }
  }
}
