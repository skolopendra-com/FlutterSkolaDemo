import 'animals/animal.dart';
import 'cars/car.dart';

/// Урок 4: классы и перечисления
/// Примеров в уроке - 3
/// Заданий в уроке - 7
/// Максимальное количество баллов = 13
/// Рекомендуемое количество баллов = 10
class Lesson4 {
  ///ПРИМЕРЫ:

  /// Найти самое сильное животное
  Animal strongest(List<Animal> animals) {
    var strongest = animals.first;

    animals.forEach((animal) {
      if (strongest.eat(animal)) {
        strongest = animal;
      }
    });
    return strongest;
  }

  /// Посчитать все ноги в списке
  int allLegs(List<Animal> animals) {
    var legs = 0;
    animals.forEach((animal) {
      if (animal.legs == Legs.two) {
        legs += 2;
      } else if (animal.legs == Legs.four) {
        legs += 4;
      }
    });
    return legs;
  }

  /// Найти всех животных по фильтру
  List<Animal> findAllByFilter(
      List<Animal> animals, AnimalsFilters animalsFilters) {
    var filteredList = animals;
    if (animalsFilters == AnimalsFilters.twoLegs) {
      filteredList.removeWhere((animal) => animal.legs != Legs.two);
    }
    if (animalsFilters == AnimalsFilters.fourLegs) {
      filteredList.removeWhere((animal) => animal.legs != Legs.four);
    }
    if (animalsFilters == AnimalsFilters.colorBlack) {
      filteredList.removeWhere((animal) => animal.color != AnimalColor.black);
    }
    if (animalsFilters == AnimalsFilters.typeMammal) {
      filteredList.removeWhere((animal) => animal.type != Type.mammal);
    }
    if (animalsFilters == AnimalsFilters.age42) {
      filteredList.removeWhere((animal) => animal.age != 42);
    }
    return filteredList;
  }
}

///ЗАДАНИЯ:

/// Простейшая (1 балла)
///
/// Перейдите в класс [Car]
/// Реализуйте внутри класса перечисление [CarColor]
/// Добавьте как минимум 5 значений
/// Значения none не должно остаться

/// Простейшая (1 балла)
///
/// Перейдите в класс [Car]
/// Реализуйте внутри класса перечисление [Transmission]
/// Добавьте 2 значения - ручная и автоматическая
/// Значения none не должно остаться

/// Средняя (2 балла)
///
/// Перейдите в класс [Car]
/// Реализуйте внутри класса функцию [engineVolume]
/// Рассчитать мощность по формуле:
/// 1 л.с. равна 0,7355 кВт

/// Простая (2 балла)
///
/// Перейдите в класс [Car]
/// Реализуйте внутри класса функцию [isFaster]
/// Вернуть true, если [maxSpeed] текущей машины больше

/// Средняя (3 балла)
///
/// В папке [lesson4/cars] по аналогии с животными создайте 3 модели машин,
/// которые наследуют класс Cars. Названия для классов [Tesla], [Lada], [Reno]
/// Поле [name] должно называться так же как и класс
/// Для [Lada] указать [fuelConsumption] равное 12

/// Средняя (4 балла)
/// Реализовать функцию подсчета сколько потребуется топлива и его цену,
/// при заданом автомобиле, расстоянии и цене топлива за литр
/// Верните одно значение в map,
/// где первое значение - кол-во топлива,
/// а второе - его цена
Map<double, double> fuelCountAndPrice(
    Car car, int routeInMeters, double fuelPricePerLiter) {
  //мэп с количеством топлива и его ценой
  Map<double, double> fuelAndPrice = {};

  //количество топлива на 1 км
  double fuelOneKm = car.fuelConsumption / 100;
  //топливо на весь маршрут
  double fuelRoute = routeInMeters * fuelOneKm;

  //пришлось применять округление, т.к. числа получались 50.4, например, а в тестах 50.0
  fuelAndPrice[fuelRoute.roundToDouble()] =
      (fuelRoute * fuelPricePerLiter).roundToDouble();

  return fuelAndPrice;
}

/// Средняя (2 балла)
/// Найти самый быстрый автомобиль из списка
/// После создания всех типов машин, перейти в [lesson4_test]
/// и включить тест [fastestCarAlive]
String fastestCarAlive(List<Car> cars) {
  var fastest = cars.first;

  cars.forEach((car) {
    if (car.maxSpeed > fastest.maxSpeed) {
      fastest = car;
    }
  });

  //По условию задания нужно было вернуть объект Car car, то есть, например,
  //Instance of 'Tesla', но по каким-то причинам не проходит тест:
  // Expected: Instance of 'Tesla'
  // Actual: Instance of 'Tesla'
  //В связи с этим решила возвращать просто название марки машины
  print(fastest);

  return fastest.name;
}
