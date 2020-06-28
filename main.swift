func parseCommand(command: String) -> (name: String, args: [String]) {
  var arr = command.split(separator: " ").map{ String($0) }.filter{$0 != ""}
  let cmd = arr[0]
  arr.removeFirst()
  return (cmd, arr)
}

func listGames() {
  print("Sélectionnez un jeu")
  print("guess - Devinez le nombre aléatoire")
  print("quit - Quitter le logiciel")
}

var is_ended: Bool = false
typealias commandFunc = (String, [String]) -> Bool
var commands = [String : commandFunc]()
var currentGame: Game? = nil

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
  }
  return true
}

commands["guess"] = {
  (name: String, args: [String]) -> Bool in
  currentGame = Guess()
  if let unwrapped = currentGame {
    unwrapped.reset()
    unwrapped.start()
  }
  return true
}

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
      print("Commande inconnue")
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
