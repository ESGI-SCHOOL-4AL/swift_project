enum NumericError: Error {
  case emptyInput
  case invalidInputType
}

func read_numeric_input(_ read_value: String?) throws -> Int {
  if read_value == nil {
    throw NumericError.emptyInput
  }

  let numeric_convertion = Int(read_value!)

  if numeric_convertion == nil {
    throw NumericError.invalidInputType
  }

  return numeric_convertion!
}