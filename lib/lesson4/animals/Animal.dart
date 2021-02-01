import 'dart:math';

abstract class Animal {
  String name;

  String noise;

  Type type;

  Legs legs;

  AnimalColor color;

  int age;

  int health;

  int armor;

  bool isHidden = false;

  int get defendLevel => armor + health - age;

  Animal(
    this.name,
    this.noise,
    this.type,
    this.legs,
    this.color,
    this.age,
    this.health,
    this.armor, {
    this.isHidden,
  });

  bool eat(Animal otherAnimal) {
    if (otherAnimal.type != type) {
      print('attack is true cause type mismatch');
      return false;
    } else if (otherAnimal.isHidden) {
      print('attack is false cause other animal is hidden');
      return false;
    } else if (otherAnimal.defendLevel < defendLevel) {
      print('attack is true cause your animal stronger');
      return true;
    } else if (otherAnimal.defendLevel == defendLevel) {
      var rndBool = Random().nextBool();
      print('attack is $rndBool cause of 42');
      return rndBool;
    } else {
      print('attack is true cause of your lucky day');
      return true;
    }
  }

}

enum Legs { none, two, four }

enum Type { bird, fish, mammal }

enum AnimalColor { red, green, blue, black, white }
