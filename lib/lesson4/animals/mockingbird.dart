import 'animal.dart';

class Mockingbird extends Animal {
  @override
  String name = 'Сойка пересмешница';

  @override
  String noise = 'Чирик';

  @override
  Type type = Type.bird;

  @override
  Legs legs = Legs.two;

  @override
  AnimalColor color = AnimalColor.blue;

  @override
  int age = 1;

  @override
  int health = 1;

  @override
  int armor = 1;

  Mockingbird(
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
