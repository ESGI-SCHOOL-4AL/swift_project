protocol Game {
  func reset()
  func start()
  func stop()
  func isOver() -> Bool
  func onCommand(command: String, args: [String]) -> Bool
}