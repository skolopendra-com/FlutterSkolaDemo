import 'dart:math';

/// Урок 1: простые функции.
/// Операции с целыми и вещественными числами.
/// Оперции с логическими значениями
/// Примеров в уроке - 5
/// Заданий в уроке - 9
/// Максимальное количество баллов = 18
/// Рекомендуемое количество баллов = 9
class Lesson1 {
  ///ПРИМЕРЫ:

  /// Вычисление квадрата целого числа
  int sqr(int x) => x * x;

  /// Вычисление квадрата вещественного числа
  double sqrDouble(double x) => x * x;

  /// Вычисление дискриминанта квадратного уравнения
  double discriminant(double a, double b, double c) => sqrDouble(b) - 4 * a * c;

  /// Поиск одного из корней квадратного уравнения
  double quadraticEquationRoot(double a, double b, double c) =>
      (-b + sqrt(discriminant(a, b, c))) / (2 * a);

  /// Поиск произведения корней квадратного уравнения
  double quadraticRootProduct(double a, double b, double c) {
    var sd = sqrt(discriminant(a, b, c));
    var x1 = (-b + sd) / (2 * a);
    var x2 = (-b - sd) / (2 * a);
    return x1 * x2; // Результат
  }
}

///ЗАДАНИЯ:

/// Тривиальная (3 балла).
///
/// Задача имеет повышенную стоимость как первая в списке.
///
/// Пользователь задает время в часах, минутах и секундах, например, 8:20:35.
/// Рассчитать время в секундах, прошедшее с начала суток (30035 в данном случае).
int seconds(int hours, int minutes, int seconds) {
  if (hours == null || minutes == null || seconds == null) {
    throw InputValueIsNullException('Input value is null, but not-null value expected');
  }
  final hoursOutOfRange = hours < 0 || hours > 24;
  final minutesOutOfRange = minutes < 0 || minutes > 60;
  final secondsOutOfRange = seconds < 0 || seconds > 60;
  if (hoursOutOfRange || minutesOutOfRange || secondsOutOfRange) {
    throw NumberIsOutOfRangeException('Input value is out of range');
  }
  return hours * 3600 + minutes * 60 + seconds;
}

/// Тривиальная (1 балл)
///
/// Пользователь задает длину отрезка в саженях, аршинах и вершках (например, 8 саженей 2 аршина 11 вершков).
/// Определить длину того же отрезка в метрах (в данном случае 18.98).
/// 1 сажень = 3 аршина = 48 вершков, 1 вершок = 4.445 см.
double lengthInMeters(int sagenes, int arshins, int vershoks) {
  defaultChecker([sagenes, arshins, vershoks]);
  final totalVershkov = sagenes * 48 + arshins * 16 + vershoks;
  return double.parse((totalVershkov * 4.445 / 100).toStringAsFixed(2));
}

/// Простая (2 балла)
///
/// Пользователь задает целое число, большее 100 (например, 3801).
/// Определить третью цифру справа в этом числе (в данном случае 8).
int thirdDigit(int number) {
  defaultChecker([number]);
  return number ~/ 100 % 10;
}

/// Простая (2 балла)
///
/// Поезд вышел со станции отправления в h1 часов m1 минут (например в 9:25) и
/// прибыл на станцию назначения в h2 часов m2 минут того же дня (например в 13:01).
/// Определите время поезда в пути в минутах (в данном случае 216).
int travelMinutes(
    int hoursDepart, int minutesDepart, int hoursArrive, int minutesArrive) {
  if (hoursDepart == null || minutesDepart == null || hoursArrive == null || minutesArrive == null) {
    throw InputValueIsNullException('Input value is null, but not-null value expected');
  }
  final hoursDepartOutOfRange = hoursDepart < 0 || hoursDepart > 24;
  final hoursArriveOutOfRange = hoursArrive < 0 || hoursArrive > 24;
  final minutesDepartOutOfRange = minutesDepart < 0 || minutesDepart > 60;
  final minutesArriveOutOfRange = minutesArrive < 0 || minutesArrive > 60;
  if (hoursDepartOutOfRange || hoursArriveOutOfRange || minutesDepartOutOfRange || minutesArriveOutOfRange) {
    throw NumberIsOutOfRangeException('Input value is out of range');
  }
  if (hoursDepart > hoursArrive || hoursArrive == hoursDepart && minutesDepart > minutesArrive) {
    throw WrongInputStateException('Input values are in a wrong state');
  }
  return (hoursArrive - hoursDepart) * 60 + (minutesArrive - minutesDepart);
}

/// Простая (2 балла)
///
/// Человек положил в банк сумму в s рублей под p% годовых (проценты начисляются в конце года).
/// Сколько денег будет на счету через 3 года (с учётом сложных процентов)?
/// Например, 100 рублей под 10% годовых превратятся в 133.1 рубля
double accountInThreeYears(int initial, int percent) {
  defaultChecker([initial, percent]);
  var accountForCurrentIter = initial.toDouble();
  final percentForm = percent / 100;
  for (var i = 0; i < 3; i++) {
    accountForCurrentIter += accountForCurrentIter * percentForm;
  }
  return accountForCurrentIter;
}

/// Простая (2 балла)
///
/// Пользователь задает целое трехзначное число (например, 478).
/// Необходимо вывести число, полученное из заданного перестановкой цифр в обратном порядке (например, 874).
int numberRevert(int number) {
  if (number == null) {
    throw InputValueIsNullException('Input value is null, but not-null value expected');
  }
  if (number < 100 || number > 999) {
    throw NumberIsOutOfRangeException('Input value is out of range');
  }
  final firstPos = number % 10 * 100;
  final secondPos = number % 100 ~/ 10 * 10;
  final thirdPos = number ~/ 100;
  return firstPos + secondPos + thirdPos;
}

/// Простая (2 балла)
///
/// Четырехзначное число назовем счастливым, если сумма первых двух ее цифр равна сумме двух последних.
/// Определить, счастливое ли заданное число, вернуть true, если это так.
bool isNumberHappy(int number) {
  if (number == null) {
    throw InputValueIsNullException('Input value is null, but not-null value expected');
  }
  if (number < 1000 || number > 9999) {
    throw NumberIsOutOfRangeException('Input value is out of range');
  }
  final firstPos = number ~/ 1000;
  final secondPos = number ~/ 100 % 10;
  final thirdPos = number ~/ 10 % 10;
  final fourthPos = number % 10;
  return firstPos + secondPos == thirdPos + fourthPos;
}

/// Простая (2 балла)
///
/// На шахматной доске стоят два ферзя (ферзь бьет по вертикали, горизонтали и диагоналям).
/// Определить, угрожают ли они друг другу. Вернуть true, если угрожают.
/// Считать, что ферзи не могут загораживать друг друга.
bool queenThreatens(int x1, int y1, int x2, int y2) {
  if (x1 == null || x2 == null || y1 == null || y2 == null) {
    throw InputValueIsNullException('Input value is null, but not-null value expected');
  }
  final verticalThreat = x1 == x2;
  final horizontalThreat = y1 == y2;
  final diagonalThreat = (x1 - x2).abs() == (y1 - y2).abs();
  return verticalThreat || horizontalThreat || diagonalThreat;
}

/// Простая (2 балла)
///
/// Дан номер месяца (от 1 до 12 включительно) и год (положительный).
/// Вернуть число дней в этом месяце этого года по григорианскому календарю.
int daysInMonth(int month, int year) {
  if (month == null || year == null) {
    throw InputValueIsNullException('Input value is null, but not-null value expected');
  }
  if (year < 0 || month < 0 || month > 12) {
    throw NumberIsOutOfRangeException('Input value is out of range');
  }
  final nextMonth = month == 12
      ? DateTime(year + 1, 1, 1)
      : DateTime(year, month + 1, 1);
  return nextMonth.subtract(Duration(days: 1)).day;
}

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

// utils
void defaultChecker(List list) {
  for (var element in list) {
    if (element == null) {
      throw InputValueIsNullException('Input value is null, but not-null value expected');
    }
    if (element < 0) {
      throw NumberIsOutOfRangeException('Input value is out of range');
    }
  }
}
