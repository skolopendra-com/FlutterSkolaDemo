import 'package:main/utils.dart';

abstract class Car {
  //Название марки машины
  String name;

  //Объем двигателя
  double get engineVolume {
    return this.horsepower == null ? (this.horsepower * 0.7355) : null;
  }

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

  bool isFaster(Car otherCar) {
    nullValueChecker([otherCar.maxSpeed, this.maxSpeed == null]);
    return this.maxSpeed > otherCar.maxSpeed;
  }
}

enum CarColor {
  RED,
  BLUE,
  WHITE,
  YELLOW,
  ORANGE
}

enum Transmission {
  HAND,
  AUTO
}
