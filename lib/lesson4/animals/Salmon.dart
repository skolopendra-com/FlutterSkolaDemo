import 'package:FlutterSkolaDemo/lesson4/animals/Animal.dart';

class Salmon extends Animal {
  @override
  String name = 'Лосось';

  @override
  Type type = Type.fish;

  @override
  Legs legs = Legs.none;

  @override
  AnimalColor color = AnimalColor.blue;

  @override
  int age = 2;

  @override
  int health = 2;

  @override
  int armor = 2;

  Salmon({String name, String noise, Type type, Legs legs, AnimalColor color,
      int age, int health, int armor})
      : super(name, noise, type, legs, color, age, health, armor);
}
