import 'car.dart';

class Tesla extends Car {
  Tesla(
      {String name,
      int maxSpeed,
      int horsepower,
      CarColor color,
      Transmission transmission,
      int fuelConsumption})
      : super(name, maxSpeed, horsepower, color, transmission, fuelConsumption);
}
