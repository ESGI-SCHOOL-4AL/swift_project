class PrimeNumber: Game {
  let name = "prime"
  let description = "Pendant 3 itérations, essayé de devinner si le nombre est premier"
  let maxIteration = 2

  var currentValue: Int
  var over: Bool
  var iterationNumber: UInt

  init() {
    currentValue = Int.random(in: 0 ... 500))
    over = false
    iterationNumber = 0
  }

  reset() {}
    func reset() {
    over = false
    currentValue = Int.random(in: 0 ... 500))
  }

  func start() {
    print("Le nombre \(currentValue) est-il premier ?")
  }

  func stop() {
    over = true
  }

  func isOver() -> Bool {
    return over
  }

  func onCommand(command: String, args: [String]) -> Bool {
    let user_answer = command

    if user_answer.lowercased() == "oui" && isPrime(currentValue) {
      print("Il est prime")
      
    } else if user_answer.lowercased() == "non" && isPrime(currentValue) {
      print("Il n'est pas prime")

    }else {
      return false
    }

    reset()
    
    iterationNumber += 1

    if iterationNumber == maxIteration {
      isOver()
    }

    return true
      
  }

  func isPrime() {
    if currentValue <= 1 {
      return false
    }

    for i in 2 ..< currentValue {
      if currentValue % 2 == 0 {
        return false
      }
    }

    return true

  }


}