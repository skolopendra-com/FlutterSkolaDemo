import 'car.dart';

class Reno extends Car {
  Reno(
      {String name = 'Reno',
        int maxSpeed,
        int horsepower,
        CarColor color,
        Transmission transmission,
        int fuelConsumption})
      : super(name, maxSpeed, horsepower, color, transmission, fuelConsumption);
}
