import 'package:FlutterSkolaDemo/lesson4/animals/Animal.dart';

class Dog extends Animal {
  @override
  String name = 'Собака';

  @override
  String noise = 'Гав';

  @override
  Type type = Type.mammal;

  @override
  Legs legs = Legs.four;

  @override
  AnimalColor color = AnimalColor.white;

  @override
  int age = 2;

  @override
  int health = 10;

  @override
  int armor = 12;

  Dog(
      {String name,
      String noise,
      Type type,
      Legs legs,
      AnimalColor color,
      int age,
      int health,
      int armor})
      : super(name, noise, type, legs, color, age, health, armor);
}
