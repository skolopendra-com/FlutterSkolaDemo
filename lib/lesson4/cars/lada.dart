import 'car.dart';

class Lada extends Car {
  @override
  String name = 'Lada';

  @override
  int horsepower = 140;

  @override
  int maxSpeed = 200;

  @override
  int fuelConsumption = 12;
  Lada(
      {String name,
      int maxSpeed,
      int horsepower,
      CarColor color,
      Transmission transmission,
      int fuelConsumption})
      : super(name, maxSpeed, horsepower, color, transmission, fuelConsumption);
}
