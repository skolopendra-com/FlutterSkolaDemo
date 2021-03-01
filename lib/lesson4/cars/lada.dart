import 'car.dart';

class Lada extends Car {
  Lada(
      {String name,
      int maxSpeed,
      int horsepower,
      CarColor color,
      Transmission transmission,
      int fuelConsumption})
      : super(name, maxSpeed, horsepower, color, transmission, fuelConsumption);
}
