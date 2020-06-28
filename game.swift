protocol Game {
  var name: String { get }
  var description: String { get }

  func reset()
  func start()
  func stop()
  func isOver() -> Bool
  func onCommand(command: String, args: [String]) -> Bool
}