abstract class Animal {
  String name;

  String noise;

  Type type;

  Legs legs;

  AnimalColor color;

  int age;

  int health;

  int armor;

  int get defendLevel => armor + health - age;

  Animal(this.name, this.noise, this.type, this.legs, this.color, this.age,
      this.health, this.armor);

  bool eat(Animal otherAnimal) {
    if (otherAnimal.defendLevel < defendLevel) {
      print('attack is true cause your animal stronger');
      return true;
    } else {
      print('attack is true cause of your lucky day');
      return true;
    }
  }
}

enum Legs { none, two, four }

enum Type { bird, fish, mammal }

enum AnimalColor { red, green, blue, black, white }

enum AnimalsFilters { colorBlack, twoLegs, fourLegs, typeMammal, age42 }
