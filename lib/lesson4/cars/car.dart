abstract class Car {
  //Название марки машины
  String name;

  //Объем двигателя
  double get engineVolume {
    //TODO
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
    //TODO
  }
}

enum CarColor {
  none,
  //TODO
}

enum Transmission {
  none,
  //TODO
}
