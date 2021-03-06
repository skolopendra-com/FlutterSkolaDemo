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
  return hours * 3600 + minutes * 60 + seconds;
}

/// Тривиальная (1 балл)
///
/// Пользователь задает длину отрезка в саженях, аршинах и вершках (например, 8 саженей 2 аршина 11 вершков).
/// Определить длину того же отрезка в метрах (в данном случае 18.98).
/// 1 сажень = 3 аршина = 48 вершков, 1 вершок = 4.445 см.
double lengthInMeters(int sagenes, int arshins, int vershoks) {
  double vershRes = vershoks * 0.04445;
  double arshRes = arshins * 0.7112;
  double sagRes = sagenes * 2.1336;
  double result = vershRes + arshRes + sagRes;
  return num.parse(result.toStringAsFixed(2));
}

/// Простая (2 балла)
///
/// Пользователь задает целое число, большее 100 (например, 3801).
/// Определить третью цифру справа в этом числе (в данном случае 8).
int thirdDigit(int number) {
  int left = number % 1000;
  int numberRes = left ~/ 100;
  return numberRes;
}

/// Простая (2 балла)
///
/// Поезд вышел со станции отправления в h1 часов m1 минут (например в 9:25) и
/// прибыл на станцию назначения в h2 часов m2 минут того же дня (например в 13:01).
/// Определите время поезда в пути в минутах (в данном случае 216).
int travelMinutes(
    int hoursDepart, int minutesDepart, int hoursArrive, int minutesArrive) {
  return hoursArrive * 60 + minutesArrive - (hoursDepart * 60 + minutesDepart);
}

/// Простая (2 балла)
///
/// Человек положил в банк сумму в s рублей под p% годовых (проценты начисляются в конце года).
/// Сколько денег будет на счету через 3 года (с учётом сложных процентов)?
/// Например, 100 рублей под 10% годовых превратятся в 133.1 рубля
double accountInThreeYears(int initial, int percent) {
  double p = percent / 100 + 1;
  double tripleP = p * p * p;
  return num.parse((initial * tripleP).toStringAsFixed(1));
}

/// Простая (2 балла)
///
/// Пользователь задает целое трехзначное число (например, 478).
/// Необходимо вывести число, полученное из заданного перестановкой цифр в обратном порядке (например, 874).
int numberRevert(int number) {
  int firstNum = number ~/ 100;
  int secondNum = number % 100 ~/ 10;
  int thirdNum = number % 10;

  return thirdNum * 100 + secondNum * 10 + firstNum;
}

/// Простая (2 балла)
///
/// Четырехзначное число назовем счастливым, если сумма первых двух ее цифр равна сумме двух последних.
/// Определить, счастливое ли заданное число, вернуть true, если это так.
bool isNumberHappy(int number) {
  int firstNum = number ~/ 1000;
  int secondNum = number % 1000 ~/ 100;
  int thirdNum = number % 100 ~/ 10;
  int fourthNum = number % 10;

  if (firstNum + secondNum == thirdNum + fourthNum) {
    return true;
  } else {
    return false;
  }
}

/// Простая (2 балла)
///
/// На шахматной доске стоят два ферзя (ферзь бьет по вертикали, горизонтали и диагоналям).
/// Определить, угрожают ли они друг другу. Вернуть true, если угрожают.
/// Считать, что ферзи не могут загораживать друг друга.
bool queenThreatens(int x1, int y1, int x2, int y2) {
  if ((x1 == x2) || (y1 == y2) || (x1 - x2).abs() == (y1 - y2).abs()) {
    return true;
  } else {
    return false;
  }
}

/// Простая (2 балла)
///
/// Дан номер месяца (от 1 до 12 включительно) и год (положительный).
/// Вернуть число дней в этом месяце этого года по григорианскому календарю.
int daysInMonth(int month, int year) {
  if (month == 2) {
    final bool isLeapYear =
        (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
    if (isLeapYear) return 29;
    return 28;
  }

  if (month == 1 ||
      month == 3 ||
      month == 5 ||
      month == 7 ||
      month == 8 ||
      month == 10 ||
      month == 12) {
    return 31;
  } else {
    return 30;
  }
}
