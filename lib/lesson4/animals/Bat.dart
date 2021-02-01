import 'package:FlutterSkolaDemo/lesson4/animals/Animal.dart';

class Bat extends Animal {
  @override
  String name = 'Летучая мышь';

  @override
  String noise = 'I\'m Batman';

  @override
  Type type = Type.bird;

  @override
  Legs legs = Legs.two;

  @override
  AnimalColor color = AnimalColor.black;

  @override
  int age = 1;

  @override
  int health = 1;

  @override
  int armor = 1;

  Bat(String name, String noise, Type type, Legs legs, AnimalColor color,
      int age, int health, int armor)
      : super(name, noise, type, legs, color, age, health, armor);
}
