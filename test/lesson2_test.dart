import 'package:FlutterSkolaDemo/lesson2.dart';
import 'package:test/test.dart';

void main() {
  //Примеры тестов для примеров функций

  test('Example quadraticRootNumber', () {
    expect(Lesson2().quadraticRootNumber(1.0, 2.0, 1.0), 1);
    expect(Lesson2().quadraticRootNumber(1.0, 3.0, 2.0), 2);
    expect(Lesson2().quadraticRootNumber(1.0, 4.0, 10.0), 0);
  });

  test('Example gradeNotation', () {
    expect(Lesson2().gradeNotation(5), 'отлично');
    expect(Lesson2().gradeNotation(3), 'удовлетворительно');
    expect(Lesson2().gradeNotation(42), 'несуществующая оценка 42');
  });

  test('Example isPrime', () {
    expect(Lesson2().isPrime(1), false);
    expect(Lesson2().isPrime(2), true);
    expect(Lesson2().isPrime(5), true);
    expect(Lesson2().isPrime(11), true);
    expect(Lesson2().isPrime(4), false);
    expect(Lesson2().isPrime(9), false);
    expect(Lesson2().isPrime(15), false);
    var count = 0;
    for (var n = 2; n <= 7919; n++) {
      if (Lesson2().isPrime(n)) {
        count++;
      }
    }
    expect(count, 1000);
    count = 0;
    for (var n = 2; n <= 1000000; n++) {
      if (Lesson2().isPrime(n)) {
        count++;
      }
    }
    expect(count, 78498);
  });

  test('Example digitCountInNumber', () {
    expect(Lesson2().digitCountInNumber(0, 0), 1);
    expect(Lesson2().digitCountInNumber(7, 7), 1);
    expect(Lesson2().digitCountInNumber(21, 3), 0);
    expect(Lesson2().digitCountInNumber(510, 5), 1);
    expect(Lesson2().digitCountInNumber(4784041, 4), 3);
    expect(Lesson2().digitCountInNumber(5373393, 3), 4);
  });

  //Проверка заданий из урока

  test('2 points, ageDescription', () {
    expect(ageDescription(1), '1 год');
    expect(ageDescription(21), '21 год');
    expect(ageDescription(132), '132 года');
    expect(ageDescription(12), '12 лет');
    expect(ageDescription(111), '111 лет');
    expect(ageDescription(199), '199 лет');
  });

  test('2 points, rookOrBishopThreatens', () {
    expect(rookOrBishopThreatens(4, 5, 5, 7, 8, 8), 0);
    expect(rookOrBishopThreatens(2, 8, 6, 8, 1, 6), 1);
    expect(rookOrBishopThreatens(5, 4, 3, 7, 1, 8), 2);
    expect(rookOrBishopThreatens(1, 6, 7, 6, 3, 8), 3);
  });

  test('2 points, triangleKind', () {
    expect(triangleKind(3.0, 7.5, 4.0), -1);
    expect(triangleKind(5.0, 3.0, 4.0), 1);
    expect(triangleKind(4.0, 6.0, 8.0), 2);
    expect(triangleKind(1.0, 1.5, 1.5), 0);
  });

  test('2 points, digitNumber', () {
    expect(digitNumber(0), 1);
    expect(digitNumber(7), 1);
    expect(digitNumber(10), 2);
    expect(digitNumber(99), 2);
    expect(digitNumber(123), 3);
    expect(digitNumber(321), 3);
  });

  test('2 points, fib', () {
    expect(fib(1), 1);
    expect(fib(2), 1);
    expect(fib(5), 5);
    expect(fib(8), 21);
    expect(fib(40), 102334155);
    expect(fib(46), 1836311903);
  });

  test('3 points, lcm', () {
    expect(lcm(13, 13), 13);
    expect(lcm(2, 8), 8);
    expect(lcm(39, 75), 975);
    expect(lcm(13579, 98631), 1339310349);
    expect(lcm(2, 1011111111), 2022222222);
    expect(lcm(1011111111, 2), 2022222222);
  });

  test('3 points, isCoPrime', () {
    expect(isCoPrime(25, 49), true);
    expect(isCoPrime(6, 8), false);
    expect(isCoPrime(17, 97), true);
    expect(isCoPrime(37, 111), false);
    expect(isCoPrime(1234567890, 908765431), true);
    expect(isCoPrime(2109876543, 1234567891), true);
  });

  test('3 points, revert', () {
    expect(revert(13478), 87431);
    expect(revert(0), 0);
    expect(revert(3), 3);
    expect(revert(111), 111);
    expect(revert(17571), 17571);
    expect(revert(987654321), 123456789);
  });

  test('3 points, isPalindrome', () {
    expect(isPalindrome(3), true);
    expect(isPalindrome(3653), false);
    expect(isPalindrome(15751), true);
    expect(isPalindrome(24688642), true);
    expect(isPalindrome(2147447412), true);
  });

  test('4 points, squareSequenceDigit', () {
    expect(squareSequenceDigit(1), 1);
    expect(squareSequenceDigit(2), 4);
    expect(squareSequenceDigit(7), 5);
    expect(squareSequenceDigit(12), 6);
    expect(squareSequenceDigit(17), 0);
    expect(squareSequenceDigit(27), 9);
  });

  test('5 points, squareSequenceDigit', () {
    expect(fibSequenceDigit(1), 1);
    expect(fibSequenceDigit(2), 1);
    expect(fibSequenceDigit(4), 3);
    expect(fibSequenceDigit(9), 2);
    expect(fibSequenceDigit(14), 5);
    expect(fibSequenceDigit(20), 2);
  });
}
