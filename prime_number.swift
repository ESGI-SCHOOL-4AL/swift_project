class PrimeNumber: Game {
  let name = "prime"
  let description = "Pendant 3 itérations, essayez de deviner si le nombre est premier"
  let maxIteration = 3

  var currentValue: Int
  var prime: Bool
  var over: Bool
  var iterationNumber: UInt

  init() {
    over = false
    iterationNumber = 0
    currentValue = 0
    prime = false
    reset()
  }

  func reset() {
    over = false
    iterationNumber = 0
  }

  func generateNumber() {
    currentValue = Int.random(in: 0 ... 500)
    prime = isPrime(n: currentValue)
    print("Le nombre \(currentValue) est-il premier ? (oui/non)")
  }

  func start() {
    generateNumber()
  }

  func stop() {
    over = true
  }

  func isOver() -> Bool {
    return over
  }

  func onCommand(command: String, args: [String]) -> Bool {
    let user_answer = command.lowercased()

    switch user_answer {
      case "oui":
        if prime {
          print("Bravo ! Il est premier !")
        } else {
          print("Raté")
        }
      case "non":
        if prime {
          print("Bravo ! Il n'est pas premier !")
        } else {
          print("Raté")
        }
      default:
        return false
    }
    
    iterationNumber += 1

    if iterationNumber == maxIteration {
      stop()
    } else {
      generateNumber()
    }

    return true
      
  }

  func isPrime(n: Int) -> Bool {
    if n <= 1 {
      return false
    }

    for i in 2 ..< n {
      if n % i == 0 {
        return false
      }
    }

    return true

  }


}