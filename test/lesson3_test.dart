import 'package:main/lesson3.dart';
import 'package:test/test.dart';

void main() {
  //Примеры тестов для примеров функций

  test('Example sqRoots', () {
    expect(Lesson3().sqRoots(-1.0), []);
    expect(Lesson3().sqRoots(0.0), [0.0]);
    expect(Lesson3().sqRoots(25.0), [-5.0, 5.0]);
  });

  test('Example negativeList', () {
    expect(Lesson3().negativeList([1, 2, 3]), []);
    expect(Lesson3().negativeList([-1, 2, 4, -5]), [-1, -5]);
  });

  test('Example invertPositives', () {
    expect(Lesson3().invertPositives([1, 2, 3]), [-1, -2, -3]);
    expect(Lesson3().invertPositives([-1, 2, 4, -5]), [-1, -2, -4, -5]);
  });

  test('Example invertPositives', () {
    expect(Lesson3().squares([0]), [0]);
    expect(Lesson3().squares([1, 2, -3]), [1, 4, 9]);
  });

  test('Example isPalindrome', () {
    expect(Lesson3().isPalindrome('Барабан'), false);
    expect(Lesson3().isPalindrome('А роза упала на лапу Азора'), true);
    expect(Lesson3().isPalindrome('Шалаш'), true);
  });

  test('Example buildSumExample', () {
    expect(Lesson3().buildSumExample([42]), '42 = 42');
    expect(
        Lesson3().buildSumExample([3, 6, 5, 4, 9]), '3 + 6 + 5 + 4 + 9 = 27');
  });

  test('Example shoppingListCostTest', () {
    expect(
        Lesson3().shoppingListCost(
            ['Хлеб', 'Молоко'], {'Хлеб': 50.0, 'Молоко': 100.0}),
        150.0);
    expect(
        Lesson3().shoppingListCost(
            ['Хлеб', 'Молоко', 'Кефир'], {'Хлеб': 50.0, 'Молоко': 100.0}),
        150.0);
    expect(Lesson3().shoppingListCost(['Хлеб', 'Молоко', 'Кефир'], {}), 0.0);
  });

  test('Example filterByCountryCode', () {
    var phoneBook = {
      'Quagmire': '+1-800-555-0143',
      'Adam\'s Ribs': '+82-000-555-2960',
      'Pharmakon Industries': '+1-800-555-6321'
    };
    expect(Lesson3().filterByCountryCode(phoneBook, '+1').length, 2);
    expect(Lesson3().filterByCountryCode(phoneBook, '+82').length, 0);
    expect(Lesson3().filterByCountryCode(phoneBook, '+999').length, 0);
  });

  //Проверка заданий из урока

  test('2 points, mean', () {
    expect(mean([]), 0.0);
    expect(mean([1.0]), 1.0);
    expect(mean([3.0, 1.0, 2.0]), 2.0);
    expect(mean([0.0, 2.0, 7.0, 8.0, -2.0]), 3.0);
  });

  test('3 points, center', () {
    expect(center([]), []);
    expect(center([3.14]), [0.0]);
    expect(center([3.0, 1.0, 2.0]), [1.0, -1.0, 0.0]);
    expect(center([0.0, 2.0, 7.0, 8.0, -2.0]), [-3.0, -1.0, 4.0, 5.0, -5.0]);
  });

  test('3 points, accumulate', () {
    expect(accumulate([]), []);
    expect(accumulate([3]), [3]);
    expect(accumulate([1, 2, 3, 4]), [1, 3, 6, 10]);
  });

  test('4 points, factorizeToString', () {
    expect(factorizeToString(2), '2');
    expect(factorizeToString(75), '3*5*5');
    expect(factorizeToString(342), '2*3*3*19');
    expect(factorizeToString(1073676289), '7*7*31*31*151*151');
    expect(factorizeToString(1073676287), '1073676287');
  });

  test('5 points, roman', () {
    expect(roman(1), 'I');
    expect(roman(3000), 'MMM');
    expect(roman(1978), 'MCMLXXVIII');
    expect(roman(694), 'DCXCIV');
    expect(roman(49), 'XLIX');
  });

  test('2 points, containsIn', () {
    expect(containsIn({'a': 'z'}, {'a': 'z', 'b': 'sweet'}), true);
    expect(containsIn({'a': 'z'}, {'a': 'zee', 'b': 'sweet'}), false);
  });

  test('2 points, subtractOf', () {
    var from = {'a': 'z', 'b': 'c'};

    subtractOf(from, {});
    expect({'a': 'z', 'b': 'c'}, from);

    subtractOf(from, {'b': 'z'});
    expect({'a': 'z', 'b': 'c'}, from);

    subtractOf(from, {'a': 'z'});
    expect({'b': 'c'}, from);
  });

  test('4 points, extractRepeats', () {
    expect(extractRepeats([]), {});
    expect(extractRepeats(['a', 'b', 'a']), {'a': 2});
    expect(extractRepeats(['a', 'b', 'c']), {});
  });

  test('5 points, propagateHandshakes', () {
    expect(
        propagateHandshakes({
          'Marat': {'Sveta'},
          'Sveta': {'Mikhail'}
        }),
        {
          'Marat': {'Mikhail', "Sveta"},
          'Sveta': {'Mikhail'},
          'Mikhail': [],
        });

    expect(
        propagateHandshakes({
          'Marat': {'Mikhail', 'Sveta'},
          'Sveta': {'Marat'},
          'Mikhail': {'Sveta'},
          'Friend': {'GoodGnome'},
          'EvilGnome': {}
        }),
        {
          'Marat': {'Mikhail', "Sveta"},
          'Sveta': {'Marat', 'Mikhail'},
          'Mikhail': {'Sveta', 'Marat'},
          'Friend': {'GoodGnome'},
          'EvilGnome': [],
          'GoodGnome': [],
        });
  });

  test('4 points, bagPacking', () {
    expect(
        bagPacking({
          'Кубок': {500: 2000},
          'Слиток': {1000: 5000}
        }, 850),
        {'Кубок'});
    expect(
        bagPacking({
          'Кубок': {500: 2000},
          'Слиток': {1000: 5000}
        }, 450),
        {});
  });
}
