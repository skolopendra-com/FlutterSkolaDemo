abstract class Car {
  String name;

  double get engineVolume{
    //1 л.с. равна 0,7355 кВт при вычислении мощности двигателя.
    //TODO
  }

  int horsepower;

  CarColor color;

  Transmission transmission;

  int maxSpeed;

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
