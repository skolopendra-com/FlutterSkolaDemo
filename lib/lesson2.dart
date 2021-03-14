import 'dart:math';

import 'lesson1.dart';

/// Урок 2: ветвления и циклы
/// Примеров в уроке - 4
/// Заданий в уроке - 11
/// Максимальное количество баллов = 31
/// Рекомендуемое количество баллов = 20
class Lesson2 {
  ///ПРИМЕРЫ:

  /// Найти число корней квадратного уравнения ax^2 + bx + c = 0
  int quadraticRootNumber(double a, double b, double c) {
    var discriminant = Lesson1().discriminant(a, b, c);
    if (discriminant > 0.0) {
      return 2;
    } else if (discriminant == 0.0) {
      return 1;
    } else {
      return 0;
    }
  }

  /// Получить строковую нотацию для оценки по пятибалльной системе
  String gradeNotation(int grade) {
    switch (grade) {
      case 5:
        return 'отлично';
        break;
      case 4:
        return 'хорошо';
        break;
      case 3:
        return 'удовлетворительно';
        break;
      case 2:
        return 'неудовлетворительно';
        break;
      default:
        return 'несуществующая оценка $grade';
        break;
    }
  }

  /// Проверка числа на простоту -- результат true, если число простое
  bool isPrime(int n) {
    if (n < 2) return false;
    if (n == 2) return true;
    if (n % 2 == 0) return false;
    for (var m = 3; m <= sqrt(n); m += 2) {
      if (n % m == 0) return false;
    }
    return true;
  }

  /// Найти число вхождений цифры m в число n
  int digitCountInNumber(int n, int m) {
    if (n == m) {
      return 1;
    } else if (n < 10) {
      return 0;
    } else {
      return digitCountInNumber(n ~/ 10, m) + digitCountInNumber(n % 10, m);
    }
  }
}

///ЗАДАНИЯ:

/// Простая (2 балла)
///
/// Мой возраст. Для заданного 0 < n < 200, рассматриваемого как возраст человека,
/// вернуть строку вида: «21 год», «32 года», «12 лет».
String ageDescription(int age) {
  if (age == null) {
    throw InputValueIsNullException('Input value is null, but not-null value expected');
  }
  if (age < 0 || age > 200) {
    throw NumberIsOutOfRangeException('Input value is out of range');
  }
  // Ages that have 1 in second position are exceptions to the rule
  final exceptionNumber = age % 100 >= 11 && age % 100 <= 20;
  if (age % 10 == 1 && !exceptionNumber) return '${age} год';
  if (age % 10 >= 2 && age % 10 <= 4 && !exceptionNumber) return '${age} года';
  return '${age} лет';
}

/// Простая (2 балла)
///
/// На шахматной доске стоят черный король и белые ладья и слон
/// (ладья бьет по горизонтали и вертикали, слон — по диагоналям).
/// Проверить, есть ли угроза королю и если есть, то от кого именно.
/// Вернуть 0, если угрозы нет, 1, если угроза только от ладьи, 2, если только от слона,
/// и 3, если угроза есть и от ладьи и от слона.
/// Считать, что ладья и слон не могут загораживать друг друга.
int rookOrBishopThreatens(int kingX, kingY, rookX, rookY, bishopX, bishopY) {
  if (kingX == null || kingY == null || rookX == null || rookY == null
      || bishopX == null || bishopY == null) {
    throw InputValueIsNullException('Input value is null, but not-null value expected');
  }
  final verticalThreat = kingX == rookX;
  final horizontalThreat = kingY == rookY;
  final diagonalThreat = (kingX - bishopX).abs() == (kingY - bishopY).abs();
  if (diagonalThreat && (horizontalThreat || verticalThreat)) return 3;
  if (diagonalThreat) return 2;
  if (horizontalThreat || verticalThreat) return 1;
  return 0;
}

/// Простая (2 балла)
///
/// Треугольник задан длинами своих сторон a, b, c.
/// Проверить, является ли данный треугольник остроугольным (вернуть 0),
/// прямоугольным (вернуть 1) или тупоугольным (вернуть 2).
/// Если такой треугольник не существует, вернуть -1.
int triangleKind(double a, b, c) {
  defaultChecker([a, b, c]);
  // If one side is bigger then sum of other sides there is no triangle with these sides
  if (c > a + b || a > b + c || b > a + c) return -1;
  // Writing bigger side to c for convenient calculations
  if (c < a) {
    final temp = c;
    c = a;
    a = temp;
  }
  if (c < b) {
    final temp = c;
    c = b;
    b = temp;
  }
  assert(c > a && c > b, 'Side c should be bigger then two other sides');
  final squareOfC = c * c;
  final sumOfSquare = a * a + b * b;
  if (squareOfC < sumOfSquare) return 0;
  if (squareOfC == sumOfSquare) return 1;
  return 2;
}

/// Простая (2 балла)
///
/// Найти количество цифр в заданном числе n.
/// Например, число 1 содержит 1 цифру, 456 -- 3 цифры, 65536 -- 5 цифр.
///
/// Использовать операции со строками в этой задаче запрещается.
int digitNumber(int n) {
  defaultChecker([n]);
  var digitNum = 0;
  do {
    n = n ~/ 10;
    digitNum++;
  } while (n >= 1);
  assert(digitNum == n.toString().length, 'Result should be equal to toString().length operation');
  return digitNum;
}

/// Простая (2 балла)
///
/// Найти число Фибоначчи из ряда 1, 1, 2, 3, 5, 8, 13, 21, ... с номером n.
/// Ряд Фибоначчи определён следующим образом: fib(1) = 1, fib(2) = 1, fib(n+2) = fib(n) + fib(n+1)
int fib(int n) {
  defaultChecker([n]);
  int fibRecursion(int n) {
    assert(n != null, 'Input value should not be null');
    assert(n > 0, 'Input value should be more then 0');
    switch(n) {
      case 1:
        return 1;
      case 2:
        return 1;
      default:
        return fib(n - 2) + fib(n - 1);
    };
  }
  return fibRecursion(n);
}

/// Средняя (3 балла)
///
/// Для заданных чисел m и n найти наименьшее общее кратное, то есть,
/// минимальное число k, которое делится и на m и на n без остатка
int lcm(int m, n) {
  defaultChecker([n, m]);
  // LCM(m, n) = m * n / GCF(m, n)
  final numbersMlp = m * n;
  // GCF(m, n) = the least (before 0) remainder
  while (n != 0) {
    final temp = m;
    m = n;
    n = temp % n;
  }
  assert(m > 0, 'M should be more then 0');
  return numbersMlp ~/ m;
}

/// Средняя (3 балла)
///
/// Определить, являются ли два заданных числа m и n взаимно простыми.
/// Взаимно простые числа не имеют общих делителей, кроме 1.
/// Например, 25 и 49 взаимно простые, а 6 и 8 -- нет.
bool isCoPrime(int m, n) {
  defaultChecker([n, m]);
  // Finding GCF(m, n)
  while (n != 0) {
    final temp = m;
    m = n;
    n = temp % n;
  }
  assert(m > 0, 'M should be more then 0');
  return m == 1;
}

/// Средняя (3 балла)
///
/// Поменять порядок цифр заданного числа n на обратный: 13478 -> 87431.
///
/// Использовать операции со строками в этой задаче запрещается.
int revert(int n) {
  defaultChecker([n]);
  if (n < 10) return n;
  var revertNumber = 0;
  do {
    revertNumber = revertNumber * 10 + n % 10;
    n = n ~/ 10;
  } while (n >= 1);
  assert(revertNumber == n.toString().split('').reversed, 'Result should be equal to reverse operation');
  return revertNumber;
}

/// Средняя (3 балла)
///
/// Проверить, является ли заданное число n палиндромом:
/// первая цифра равна последней, вторая -- предпоследней и так далее.
/// 15751 -- палиндром, 3653 -- нет.
///
/// Использовать операции со строками в этой задаче запрещается.
bool isPalindrome(int n) {
  defaultChecker([n]);
  // Taking first and last numbers of input number
  // Comparing them and then removing them from input number to continue iteration
  while (n > 9) {
    final a = n ~/ pow(10, digitNumber(n) - 1);
    final b = n % 10;
    assert(a.toString().length == 1 && b.toString().length == 1, 'Numbers should be one digit');
    if (a != b) return false;
    n = n ~/ 10 % pow(10, digitNumber(n) - 2);
  }
  return true;
}

/// Сложная (4 балла)
///
/// Найти n-ю цифру последовательности из квадратов целых чисел:
/// 149162536496481100121144...
/// Например, 2-я цифра равна 4, 7-я 5, 12-я 6.
///
/// Использовать операции со строками в этой задаче запрещается.
int squareSequenceDigit(int n) {
  defaultChecker([n]);
  var currentIterNumber = 1;
  var squareOfNumber;
  // Calculating square of each natural number
  // and subtracting number of digits from input number
  // while we don't get the needed number in the sequence
  while (n > 0) {
    squareOfNumber = currentIterNumber * currentIterNumber;
    n -= digitNumber(squareOfNumber);
    currentIterNumber++;
  }
  // Going back on number digits to the needed digit
  while(n < 0) {
    squareOfNumber = squareOfNumber ~/ 10;
    n++;
  }
  assert((squareOfNumber % 10).toString().length == 1, 'Return number should be one digit');
  return squareOfNumber % 10;
}

/// Сложная (5 баллов)
///
/// Найти n-ю цифру последовательности из чисел Фибоначчи (см. функцию fib выше):
/// 1123581321345589144...
/// Например, 2-я цифра равна 1, 9-я 2, 14-я 5.
///
/// Использовать операции со строками в этой задаче запрещается.
int fibSequenceDigit(int n) {
  defaultChecker([n]);
  var currentIterNumber = 1;
  var fibOfNumber;
  // Calculating fib of each natural number
  // and subtracting number of digits from input number
  // while we don't get the needed number in the sequence
  while (n > 0) {
    fibOfNumber = fib(currentIterNumber);
    n -= digitNumber(fibOfNumber);
    currentIterNumber++;
  }
  // Going back on number digits to the needed digit
  while(n < 0) {
    fibOfNumber = fibOfNumber ~/ 10;
    n++;
  }
  assert((fibOfNumber % 10).toString().length == 1, 'Return number should be one digit');
  return fibOfNumber % 10;
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
