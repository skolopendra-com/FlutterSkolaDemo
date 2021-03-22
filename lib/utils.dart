// Exceptions
class NumberIsOutOfRangeException implements Exception {
  String msg;
  NumberIsOutOfRangeException(this.msg);
}

class InputValueIsNullException implements Exception {
  String msg;
  InputValueIsNullException(this.msg);
}

class WrongInputStateException implements Exception {
  String msg;
  WrongInputStateException(this.msg);
}

class ValueIsNullException implements Exception {
  String msg;
  ValueIsNullException(this.msg);
}

// utils
void inputNullValueChecker(List list) {
  for (var element in list) {
    if (element == null) throw InputValueIsNullException('Input value is null, but not-null value expected');
  }
}

void nullValueChecker(List list) {
  for (var element in list) {
    if (element == null) throw ValueIsNullException('Values should not be null');
  }
}

void inputOutOfRangeChecker(bool outOfRange) {
  if (outOfRange) throw NumberIsOutOfRangeException('Input value is out of range');
}

void inputWrongStateChecker(bool wrongState) {
  if (wrongState) throw WrongInputStateException('Input values are in a wrong state');
}

void inputIsNaturalChecker(List list) {
  inputNullValueChecker(list);
  // reduce to 'if all elements are >= 0 return 0'
  inputOutOfRangeChecker(list.length == 1 ? list.first < 0 : list.reduce((value, element) =>
      value = (value == list.first ? (value < 0 ? 1 : 0) : value) + (element < 0 ? 1 : 0)) > 0);
}
