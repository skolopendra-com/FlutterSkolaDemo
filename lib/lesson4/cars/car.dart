abstract class Car {
  //Название марки машины
  String name;

  //Объем двигателя
  double get engineVolume => horsepower * 0.7355;

  //Лошадиные силы
  int horsepower;

  //Цвет машины
  CarColor color;

  //Тип трансмиссии
  Transmission transmission;

  //Максимальная скорость
  int maxSpeed;

  //Расход топлина на 100км
  int fuelConsumption;

  Car(
    this.name,
    this.maxSpeed,
    this.horsepower,
    this.color,
    this.transmission,
    this.fuelConsumption,
  );

  bool isFaster(Car otherCar) => otherCar.maxSpeed > maxSpeed;
}

enum CarColor {
  BLACK,
  WHITE,
  RED,
  GREEN,
  BLUE,
  YELLOW
}

enum Transmission {
  AUTO,
  HAND
}
