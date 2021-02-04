import 'package:FlutterSkolaDemo/lesson4/animals/Animal.dart';

class Shark extends Animal {
  @override
  String name = 'Акула';

  @override
  Type type = Type.fish;

  @override
  Legs legs = Legs.none;

  @override
  AnimalColor color = AnimalColor.white;

  @override
  int age = 1;

  @override
  int health = 100;

  @override
  int armor = 200;

  Shark({String name, String noise, Type type, Legs legs, AnimalColor color,
      int age, int health, int armor})
      : super(name, noise, type, legs, color, age, health, armor);
}
