import 'package:FlutterSkolaDemo/lesson1.dart';
import 'package:test/test.dart';

void main() {
  //Примеры тестов для примеров функций

  test('Example sqr', () {
    expect(Lesson1().sqr(0), 0);
    expect(Lesson1().sqr(2), 4);
    expect(Lesson1().sqr(-3), 9);
  });

  test('Example sqr double', () {
    expect(Lesson1().sqrDouble(0.0), 0.0);
    expect(Lesson1().sqrDouble(2.0), 4.0);
    expect(Lesson1().sqrDouble(-3.0), 9.0);
  });

  test('Example discriminant', () {
    expect(Lesson1().discriminant(0.0, 0.0, 0.0), 0.0);
    expect(Lesson1().discriminant(1.0, -2.0, 1.0), 0.0);
    expect(Lesson1().discriminant(1.0, 3.0, 2.0), 1.0);
  });

  test('Example quadraticEquationRoot', () {
    expect(Lesson1().quadraticEquationRoot(1.0, -3.0, 2.0), 2.0);
    expect(Lesson1().quadraticEquationRoot(1.0, -2.0, 1.0), 1.0);
    expect(Lesson1().quadraticEquationRoot(1.0, 6.0, 9.0), -3.0);
  });

  test('Example quadraticRootProduct', () {
    expect(Lesson1().quadraticRootProduct(1.0, -2.0, 1.0), 1.0);
    expect(Lesson1().quadraticRootProduct(1.0, 6.0, 9.0), 9.0);
    expect(Lesson1().quadraticRootProduct(1.0, 3.0, 2.0), 2.0);
  });

  //Проверка заданий из урока

  test('3 points, seconds', () {
    expect(seconds(8, 20, 35), 30035);
    expect(seconds(24, 0, 0), 86400);
    expect(seconds(0, 0, 13), 13);
  });

  test('1 point, lengthInMeters', () {
    expect(lengthInMeters(8, 2, 11), 18.98);
    expect(lengthInMeters(1, 0, 0), 2.13);
  });

  test('2 points, thirdDigit', () {
    expect(thirdDigit(3801), 8);
    expect(thirdDigit(100), 1);
    expect(thirdDigit(1000), 0);
  });

  test('2 points, travelMinutes', () {
    expect(travelMinutes(9, 25, 13, 1), 216);
    expect(travelMinutes(21, 59, 22, 0), 1);
  });

  test('2 points, accountInThreeYears', () {
    expect(accountInThreeYears(100, 10), 133.1);
    expect(accountInThreeYears(1, 0), 1.0);
    expect(accountInThreeYears(13, 100), 104.0);
  });

  test('2 points, numberRevert', () {
    expect(numberRevert(478), 874);
    expect(numberRevert(102), 201);
  });

  test('2 points, isNumberHappy', () {
    expect(isNumberHappy(1533), true);
    expect(isNumberHappy(9009), true);
    expect(isNumberHappy(3644), false);
  });

  test('2 points, queenThreatens', () {
    expect(queenThreatens(3, 6, 7, 6), true);
    expect(queenThreatens(8, 1, 1, 8), true);
    expect(queenThreatens(7, 6, 5, 7), false);
  });

  test('2 points, daysInMonth', () {
    expect(daysInMonth(1, 1990), 31);
    expect(daysInMonth(2, 1990), 28);
    expect(daysInMonth(3, 1990), 31);
    expect(daysInMonth(4, 1990), 30);
    expect(daysInMonth(5, 1990), 31);
    expect(daysInMonth(6, 1990), 30);
    expect(daysInMonth(7, 1990), 31);
    expect(daysInMonth(8, 1990), 31);
    expect(daysInMonth(2, 1992), 29);
    expect(daysInMonth(2, 1996), 29);
    expect(daysInMonth(2, 1900), 28);
    expect(daysInMonth(2, 2000), 29);
  });
}
