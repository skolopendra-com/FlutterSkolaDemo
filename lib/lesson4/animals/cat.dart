import 'animal.dart';

class Cat extends Animal {
  @override
  String name = 'Кот';

  @override
  String noise = 'Мяу';

  @override
  Type type = Type.mammal;

  @override
  Legs legs = Legs.four;

  @override
  AnimalColor color = AnimalColor.black;

  @override
  int age = 5;

  @override
  int health = 9;

  @override
  int armor = 13;

  Cat(
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
