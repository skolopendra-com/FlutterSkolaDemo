import 'car.dart';

class Tesla extends Car {
  @override
  String name = 'Tesla';

  @override
  int horsepower = 200;

  @override
  int maxSpeed = 400;

  @override
  int fuelConsumption = 20;

  Tesla(
      {String name,
      int maxSpeed,
      int horsepower,
      CarColor color,
      Transmission transmission,
      int fuelConsumption})
      : super(name, maxSpeed, horsepower, color, transmission, fuelConsumption);
}
