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
  if (age % 100 >= 11 && age % 100 <= 20) {
    return age.toString() + " лет";
  } else {
    if (age % 10 == 1) {
      return age.toString() + " год";
    } else if (age % 10 > 1 && age % 10 <= 4) {
      return age.toString() + " года";
    } else {
      return age.toString() + " лет";
    }
  }
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
  if ((kingX == rookX || kingY == rookY) &&
      ((kingX - bishopX).abs() == (kingY - bishopY).abs())) {
    return 3;
  } else if (kingX == rookX || kingY == rookY) {
    return 1;
  } else if ((kingX - bishopX).abs() == (kingY - bishopY).abs()) {
    return 2;
  } else {
    return 0;
  }
}

/// Простая (2 балла)
///
/// Треугольник задан длинами своих сторон a, b, c.
/// Проверить, является ли данный треугольник остроугольным (вернуть 0),
/// прямоугольным (вернуть 1) или тупоугольным (вернуть 2).
/// Если такой треугольник не существует, вернуть -1.
int triangleKind(double a, b, c) {
  double sqrA = a * a;
  double sqrB = b * b;
  double sqrC = c * c;
  if (a + b > c && a + c > b && b + c > a) {
    if (a >= b && a >= c) {
      if (sqrA < sqrB + sqrC)
        return 0;
      else if (sqrA == sqrB + sqrC)
        return 1;
      else
        return 2;
    } else if (b >= a && b >= c) {
      if (sqrB < sqrA + sqrC)
        return 0;
      else if (sqrB == sqrA + sqrC)
        return 1;
      else
        return 2;
    } else {
      if (sqrC < sqrA + sqrA)
        return 0;
      else if (sqrC == sqrA + sqrA)
        return 1;
      else
        return 2;
    }
  } else
    return -1;
}

/// Простая (2 балла)
///
/// Найти количество цифр в заданном числе n.
/// Например, число 1 содержит 1 цифру, 456 -- 3 цифры, 65536 -- 5 цифр.
///
/// Использовать операции со строками в этой задаче запрещается.
int digitNumber(int n) {
  int count = 0;
  if (n == 0)
    return 1;
  else {
    while (n != 0) {
      n = n ~/ 10;
      count++;
    }
    return count;
  }
}

/// Простая (2 балла)
///
/// Найти число Фибоначчи из ряда 1, 1, 2, 3, 5, 8, 13, 21, ... с номером n.
/// Ряд Фибоначчи определён следующим образом: fib(1) = 1, fib(2) = 1, fib(n+2) = fib(n) + fib(n+1)
int fib(int n) {
  if (n == 1 || n == 2) {
    return 1;
  } else {
    return fib(n - 1) + fib(n - 2);
  }
}

/// Средняя (3 балла)
///
/// Для заданных чисел m и n найти наименьшее общее кратное, то есть,
/// минимальное число k, которое делится и на m и на n без остатка
int lcm(int m, n) {
  int subRes = m * n;
  while (m != 0 && n != 0) {
    if (m > n)
      m = m % n;
    else
      n = n % m;
  }
  return subRes ~/ (m + n);
}

/// Средняя (3 балла)
///
/// Определить, являются ли два заданных числа m и n взаимно простыми.
/// Взаимно простые числа не имеют общих делителей, кроме 1.
/// Например, 25 и 49 взаимно простые, а 6 и 8 -- нет.
bool isCoPrime(int m, n) {
  while (m != 0 && n != 0) {
    if (m > n)
      m = m % n;
    else
      n = n % m;
  }

  if (m + n == 1)
    return true;
  else
    return false;
}

/// Средняя (3 балла)
///
/// Поменять порядок цифр заданного числа n на обратный: 13478 -> 87431.
///
/// Использовать операции со строками в этой задаче запрещается.
int revert(int n) {
  int dec = 1;
  int newNum = 0;
  int c;
  List<int> digits = List();
  while (n != 0) {
    c = n % 10;
    n = n ~/ 10;
    digits.add(c);
    dec *= 10;
  }

  for (var i = 0; i < digits.length; i++) {
    dec ~/= 10;
    newNum += digits[i] * dec;
  }

  return newNum;
}

/// Средняя (3 балла)
///
/// Проверить, является ли заданное число n палиндромом:
/// первая цифра равна последней, вторая -- предпоследней и так далее.
/// 15751 -- палиндром, 3653 -- нет.
///
/// Использовать операции со строками в этой задаче запрещается.
bool isPalindrome(int n) {
  int c;
  List<int> digits = List();
  while (n != 0) {
    c = n % 10;
    n ~/= 10;
    digits.add(c);
  }

  for (var i = 0; i < digits.length ~/ 2; i++) {
    if (digits[i] != digits[digits.length - 1 - i]) return false;
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
  int sqrNum = 0;
  int i = 1;
  while (n > 0) {
    sqrNum = i * i;
    n -= digitNumber(sqrNum);
    i++;
  }
  while (n < 0) {
    sqrNum ~/= 10;
    n++;
  }

  return sqrNum % 10;
}

/// Сложная (5 баллов)
///
/// Найти n-ю цифру последовательности из чисел Фибоначчи (см. функцию fib выше):
/// 1123581321345589144...
/// Например, 2-я цифра равна 1, 9-я 2, 14-я 5.
///
/// Использовать операции со строками в этой задаче запрещается.
int fibSequenceDigit(int n) {
  var i = 1;
  var fibo;
  while (n > 0) {
    fibo = fib(i);
    n -= digitNumber(fibo);
    i++;
  }
  while (n < 0) {
    fibo ~/= 10;
    n++;
  }
  return fibo % 10;
}
