abstract class Car {
  //Название марки машины
  String name;

  //Объем двигателя
  double get engineVolume {
    return horsepower * 0.7355;
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
    if (otherCar.maxSpeed > maxSpeed)
      return true;
    else
      return false;
  }
}

enum CarColor { red, black, white, blue, grey }

enum Transmission { manual, automatic }
