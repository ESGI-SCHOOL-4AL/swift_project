class Hangman: Game {

  let name = "hangman"
  let description = "Devinez le bon mot"

  let words = ["trooper", "vader", "palpatrouille"]

  let maxTries = 10

  var word: String
  var hiddenWord: [Character]
  var over: Bool
  var wrongAnswers: Int

  init() {
    over = false
    wrongAnswers = 0
    word = ""
    hiddenWord = []
    reset()
  }

  func reset() {
    over = false
    wrongAnswers = 0
    word = words.randomElement()!
    hiddenWord = [Character]()
    for _ in word {
      hiddenWord.append("_")
    }
  }

  func start() {
    print("Devinez le mot de \(word.count) lettres:")
    print(String(hiddenWord))
  }

  func stop() {
    over = true
  }

  func isOver() -> Bool {
    return over
  }

  func onCommand(command: String, args: [String]) -> Bool {
    if (command.count == 1) {
      let char = command[command.startIndex]
      let indexes = findOccurrences(of: char, str: word)
      if (indexes.count > 0) {
        for i in indexes {
          hiddenWord[i] = char
        }
      } else {
        wrongAnswers += 1
        print("Raté ! Essais restants: \(maxTries - wrongAnswers)")
      }
    } else if (command != word) {
      wrongAnswers += 1
      print("Raté ! Essais restants: \(maxTries - wrongAnswers)")
    } else {
      print("Bravo !")
      stop()
      return true
    }

    if wrongAnswers == maxTries {
      print("Perdu ! Le mot était \"\(word)\"")
      stop()
      return true
    }

    let hidden = String(hiddenWord)
    if (hidden == word) {
      print("Bravo !")
      stop()
      return true
    }

    print(hidden)
    return true
  }

  func findOccurrences(of: Character, str: String) -> [Int] {
    var indexes = [Int]()
    for (index, char) in str.enumerated() {
      if (char == of) {
        indexes.append(index)
      }
    }
    return indexes
  }
}