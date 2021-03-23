import 'dart:io';

/// Урок 5: асинхронное программирование и исключения
/// Примеров в уроке - 5
/// Заданий в уроке - 5
/// Максимальное количество баллов = 16
/// Рекомендуемое количество баллов = 12
class Lesson5 {
  ///ПРИМЕРЫ:

  /// Функция вызывает заказ юзера и выводит ошибку,
  /// попутно считая секунды до заказа
  Future<void> orderWithError() async {
    var seconds = 4;
    countSeconds(seconds);
    await printOrderMessage(true, durationIsSeconds: seconds);
  }

  /// Функция вызывает заказ юзера и выводит его,
  /// попутно считая секунды до заказа
  Future<void> orderOk() async {
    var seconds = 4;
    countSeconds(seconds);
    await printOrderMessage(false, durationIsSeconds: seconds);
  }

  /// Функция с вызовом асинхронной функции с заказом
  Future<void> printOrderMessage(bool showError,
      {int durationIsSeconds = 4}) async {
    try {
      var order =
      await fetchUserOrder(showError, durationIsSeconds: durationIsSeconds);
      print('Awaiting user order...');
      print(order);
    } catch (err) {
      print('Caught error: $err');
    }
  }

  /// Сама наша асинхронаая функция,
  /// которая в зависимости от [showError] показывает либо ошибку, либо заказ
  Future<String> fetchUserOrder(bool showError, {int durationIsSeconds = 4}) {
    if (!showError) {
      return Future.delayed(
          Duration(seconds: durationIsSeconds), () => 'Large Latte');
    } else {
      return Future.delayed(Duration(seconds: durationIsSeconds),
              () => throw 'Cannot locate user order');
    }
  }

  /// Ассинхронная функция, которая выводит каждую секунду секунды
  void countSeconds(int s) {
    for (var i = 1; i <= s; i++) {
      Future.delayed(Duration(seconds: i), () => print(i));
    }
  }
}

///ЗАДАНИЯ:

/// Простая (2 балла)
///
/// Написать функцию, которая кидает одно из двух исключений,
/// в зависимости от числа которое пришло.
/// 1 - [IntegerDivisionByZeroException]
/// 2 - [FormatException]
/// любое другое - [Exception]
/// Текст исключения может быть любой
void throwSomeThing(int what) {
  switch (what) {
    case 1:
      throw IntegerDivisionByZeroException();
      break;

    case 2:
      throw FormatException("FormatException");
      break;

    default:
      throw Exception("Exception");
  }
}

/// Простая (2 балла)
///
/// Написать функцию, которая делит число на 0.
/// Поймать исключение и вернуть само число [number]
int divideByZero(int number) {
  try {
    return number ~/ 0;
  } catch (e) {
    return number;
  }
}

/// Средняя (3 балла)
///
/// Сделать ассинхронную функцию, которая принимает объект (может быть любым)
/// Если пришло число, то вернуть его,
/// если пришла строка, то вернуть ее длинну
/// если пришло что-то еще то бросить [FormatException]
/// Перед исключением добавить задержку в 5 секунд.
Future<int> checkAndCount(Object object) async {
  final delaySecond = 5;
  Future.delayed(Duration(seconds: delaySecond));
  try {
    if (object is int) {
      return object.toInt();
    } else if (object is String) {
      return object.length;
    } else {
      throw FormatException();
    }
  } catch (e) {
    throw FormatException();
  }
}

/// Средняя (4 балла)
///
/// Вызвать асинхронно метод [checkAndCount] 2 раза и передать туда параметром 42, "42"
/// Вызвать асинхронно метод [Lesson5.countSeconds] и передать туда 42.
/// После того как [checkAndCount] вернет оба результата
/// выводить его до того пока [Lesson5.countSeconds] не закончит работать
/// В конце выполнения всех действий вернуть true
Future<bool> callAll() async {
  await checkAndCount(42);
  await checkAndCount("42");
  await Lesson5().countSeconds(42);
  return true;
}

/// Сложная (5 баллов)
///
/// Расширить метод [Lesson5.fetchUserOrder] и в зависимости от [durationIsSeconds]
/// Возвращать разнные напитки. На 4 секунды - 'Latte', на 6 секунд - 'Cappuccino', на 8 секунд - 'Espresso.
/// Сделать проверку, что в работу можно запустить одновременно только 3 приготовления кофе
/// Если запускается больше 3 потоков, то последний запущенный прерывается и прокидывается ошибка
/// Сама функция принимает массив секунд, т.е очередь приготовления кофе.
/// Если число в массиве не соотвествует списку выше, то игнорировать его
/// В конце вернуть список сваренных напитков
Future<List<String>> customUserOrder(List<int> seconds) async {
  var threadCount = 0;
  List<String> resultCoffee = [];
  bool checkTreadsCount = threadCount <= 3;

  for (var i in seconds) {
    switch (i) {
      case 4:
        if (checkTreadsCount) {
          await Future.delayed(Duration(seconds: 4));
          resultCoffee.add('Latte');
          threadCount++;
        } else
          throw Exception("Exception threadCount = ${threadCount} > 3");
        break;
      case 6:
        if (checkTreadsCount) {
          await Future.delayed(Duration(seconds: 6));
          resultCoffee.add('Cappuccino');
          threadCount++;
        } else
          throw Exception("Exception threadCount = ${threadCount} > 3");
        break;
      case 8:
        if (checkTreadsCount) {
          await Future.delayed(Duration(seconds: 8));
          resultCoffee.add('Espresso');
          threadCount++;
        } else
          throw Exception("Exception threadCount = ${threadCount} > 3");
        break;

      default:
        break;
    }
  }

  return resultCoffee;
}
