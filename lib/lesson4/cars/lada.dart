import 'car.dart';

class Lada extends Car {
  Lada(
      {String name = 'Lada',
      int maxSpeed,
      int horsepower,
      CarColor color,
      Transmission transmission,
      int fuelConsumption = 12})
      : super(name, maxSpeed, horsepower, color, transmission, fuelConsumption);
}
