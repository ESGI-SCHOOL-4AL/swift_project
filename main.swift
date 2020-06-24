
print("Bienvenue dans le projet Switf")

var is_ended: Bool = false

while(!is_ended) {
  print("Entrez votre choix: ")
  let user_choise = readLine()

  switch user_choise {
    case "show_signe":
      var first_value: Int32
      var second_value: Int32
      do {
        print("Input first value for the multiplication")
        first_value = try read_numeric_input(read_value: readLine())

        print("Input second value for the multiplication")
        second_value = try read_numeric_input(read_value: readLine())
      
      } catch is NumericError {
        print(NumericError.self)
        break
      }

      print("The result of this multiplication is \(show_signe(first_value: first_value, second_value: second_value))" )
      break

    case "stop":
      is_ended = true
      break
  
    default:
      print("Bad input retry")
  }

}
