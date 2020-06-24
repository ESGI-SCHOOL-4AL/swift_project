enum Signe {
  case minus
  case positive
}

func show_signe(first_value: Int32, second_value: Int32) -> Signe {
  let result = first_value * second_value

  if result > 0 {
    return Signe.positive
  }

  return Signe.minus
}