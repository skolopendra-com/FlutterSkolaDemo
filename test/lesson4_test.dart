import 'package:FlutterSkolaDemo/lesson4/animals/Animal.dart';
import 'package:FlutterSkolaDemo/lesson4/animals/Bat.dart';
import 'package:FlutterSkolaDemo/lesson4/animals/Cat.dart';
import 'package:FlutterSkolaDemo/lesson4/animals/Dog.dart';
import 'package:FlutterSkolaDemo/lesson4/animals/Mockingbird.dart';
import 'package:FlutterSkolaDemo/lesson4/animals/Salmon.dart';
import 'package:FlutterSkolaDemo/lesson4/animals/Shark.dart';
import 'package:FlutterSkolaDemo/lesson4/cars/Lada.dart';
import 'package:FlutterSkolaDemo/lesson4/lesson4.dart';
import 'package:test/test.dart';

void main() {
  //Примеры тестов для примеров функций

  var barnyard = [
    Bat(),
    Cat(),
    Dog(),
    Mockingbird(),
    Salmon(),
    Shark(),
  ];

  test('Example strongest', () {
    var strongest = Lesson4().strongest(barnyard);
    expect(strongest is Shark, true);
  });

  test('Example allLegs', () {
    expect(Lesson4().allLegs(barnyard), 12);
  });

  test('Example findAllByFilter', () {
    expect(
        Lesson4().findAllByFilter(barnyard, AnimalsFilters.typeMammal).length,
        2);
    expect(Lesson4().findAllByFilter(barnyard, AnimalsFilters.age42), []);
    expect(
        Lesson4().findAllByFilter(barnyard, AnimalsFilters.twoLegs).length, 0);
  });

  //Проверка заданий из урока



  test('4 points, fuelCountAndPrice', () {
    expect(fuelCountAndPrice(Lada(), 150, 29.90), {18.0 : 538.0});
    expect(fuelCountAndPrice(Lada(), 420, 42.0), {50.0 : 2117.0});
    expect(fuelCountAndPrice(Lada(), 123321, 123.321), {14799.0 : 1824968.0});
  });

  /// Рабочий тест - часть задания
  /// TODO
  test('2 points, fastestCarAlive', () {
    // var carPark = [
    //   Tesla(), Lada(), Reno(),
    // ];
    // expect(fastestCarAlive(carPark), Tesla());
  });
}
