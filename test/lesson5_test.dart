import 'dart:async';

import 'package:main/lesson5/lesson5.dart';
import 'package:test/test.dart';

void main() {
  //Примеры тестов для примеров функций

  test('Example fetchUserOrder no error', () async {
    var order = await Lesson5().fetchUserOrder(false);
    print(order);
    expect(order, 'Large Latte');
  });

  test('Example fetchUserOrder with error', () async {
    try {
      await Lesson5().fetchUserOrder(true);
    } catch (err) {
      expect(err, 'Cannot locate user order');
    }
  });

  test('Example orderOk', () async {
    await Lesson5().orderOk();
  });

  test('Example orderWithError', () async {
    try {
      await Lesson5().orderWithError();
    } catch (err) {
      expect(err, 'Cannot locate user order');
    }
  });

  //Проверка заданий из урока

  test('2 points, throwSomeThing', () {
    try {
      throwSomeThing(1);
    } catch (err) {
      expect(err is IntegerDivisionByZeroException, true);
    }
    try {
      throwSomeThing(2);
    } catch (err) {
      expect(err is FormatException, true);
    }
    try {
      throwSomeThing(42);
    } catch (err) {
      expect(err is Exception, true);
    }
  });

  test('2 points, divideByZero', () {
    expect(divideByZero(42), 42);
    expect(divideByZero(0), 0);
  });

  group('checkAndCount', () {
    Timer timer;
    setUp(() {
      timer = Timer(Duration(milliseconds: 50100), () => fail('time out!'));
    });

    tearDown(() => timer.cancel());

    test('simples values', () async {
      expect(await checkAndCount(42), 42);
      expect(await checkAndCount('42'), 2);
    });

    test('on 5 secods check. Check #1.', () async {
      expect(checkAndCount([42]), throwsA(isA<FormatException>()));
    });

    //checkAndCount([42, '42']

    test('on 5 secods check. Check #2.', () async {
      expect(checkAndCount([42, '42']), throwsA(isA<FormatException>()));
    });
  });

  test('4 points, callAll', () async {
    expect(await callAll(), true);
  });

  test('5 points, customUserOrder',  () async {
    expect(
        await customUserOrder([4, 6, 8]), ['Latte', 'Cappuccino', 'Espresso']);
      expect(await customUserOrder([4, 1, 6, 2, 3, 8, 42]),
          ['Latte', 'Cappuccino', 'Espresso']);
      try {
        await checkAndCount([42, '42']);
      } catch (err) {
        expect(err is Exception, true);
      }
    }, timeout:Timeout(Duration(seconds: 120)),);
}
