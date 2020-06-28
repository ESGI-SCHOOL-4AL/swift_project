class Guess: Game {

  var number: Int
  var over: Bool

  init() {
    number = 0
    over = false
  }

  func reset() {
    over = false
    number = Int.random(in: 0 ..< 101)
  }

  func start() {
    print("Devinez le nombre (entre 0 et 100 compris)")
  }

  func stop() {
    over = true
  }

  func isOver() -> Bool {
    return over
  }

  func onCommand(command: String, args: [String]) -> Bool {
    do {
      let n = try read_numeric_input(read_value: command)
      if n < number {
        print("Trop petit")
      } else if n > number {
        print("Trop grand")
      } else {
        print("Félicitations !")
        stop()
      }
      return true
    } catch {
      return false
    }
  }
}