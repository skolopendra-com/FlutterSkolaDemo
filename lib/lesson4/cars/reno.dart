import 'car.dart';

class Reno extends Car {
  @override
  String name = 'Reno';

  @override
  int horsepower = 170;

  @override
  int maxSpeed = 300;

  @override
  int fuelConsumption = 15;
  Reno(
      {String name,
      int maxSpeed,
      int horsepower,
      CarColor color,
      Transmission transmission,
      int fuelConsumption})
      : super(name, maxSpeed, horsepower, color, transmission, fuelConsumption);
}
