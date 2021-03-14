import 'dart:math';

/// Урок 3: коллекции и карты
/// Примеров в уроке - 8
/// Заданий в уроке - 11
/// Максимальное количество баллов = 42
/// Рекомендуемое количество баллов = 21
class Lesson3 {
  ///ПРИМЕРЫ:

  /// Найти все корни уравнения x^2 = y
  List<double> sqRoots(double y) {
    if (y < 0) {
      return [];
    } else if (y == 0.0) {
      return [0.0];
    } else {
      var root = sqrt(y);
      // Результат!
      return [-root, root];
    }
  }

  /// Выделить в список отрицательные элементы из заданного списка
  List<int> negativeList(List<int> list) {
    var result = <int>[];
    for (var element in list) {
      if (element < 0) {
        result.add(element);
      }
    }
    return result;
  }

  /// Изменить знак для всех положительных элементов списка
  List<int> invertPositives(List<int> list) {
    var revertList = <int>[];
    for (var element in list) {
      if (element > 0) {
        revertList.add(-element);
      } else {
        revertList.add(element);
      }
    }
    return revertList;
  }

  /// Из имеющегося списка целых чисел, сформировать список их квадратов
  List<int> squares(List<int> list) => list.map((e) => e * e).toList();

  /// По заданной строке str определить, является ли она палиндромом.
  /// В палиндроме первый символ должен быть равен последнему, второй предпоследнему и т.д.
  /// Одни и те же буквы в разном регистре следует считать равными с точки зрения данной задачи.
  /// Пробелы не следует принимать во внимание при сравнении символов, например, строка
  /// "А роза упала на лапу Азора" является палиндромом.
  bool isPalindrome(String str) {
    var lowerCase = str.toLowerCase().replaceAll(' ', '');
    for (var i = 0; i < lowerCase.length / 2; i++) {
      if (lowerCase[i] != lowerCase[lowerCase.length - i - 1]) return false;
    }
    return true;
  }

  /// По имеющемуся списку целых чисел, например [3, 6, 5, 4, 9], построить строку с примером их суммирования:
  /// 3 + 6 + 5 + 4 + 9 = 27 в данном случае.
  String buildSumExample(List<int> list) =>
      list.join(' + ') + ' = ${list.reduce((a, b) => a + b)}';

  /// Для заданного списка покупок `shoppingList` посчитать его общую стоимость
  /// на основе цен из `costs`. В случае неизвестной цены считать, что товар
  /// игнорируется.
  double shoppingListCost(
      List<String> shoppingList, Map<String, double> costs) {
    var totalCost = 0.0;

    for (var item in shoppingList) {
      var itemCost = costs[item];
      if (itemCost != null) {
        totalCost += itemCost;
      }
    }

    return totalCost;
  }

  /// Для набора "имя"-"номер телефона" `phoneBook` оставить только такие пары,
  /// для которых телефон начинается с заданного кода страны `countryCode`
  Map<String, String> filterByCountryCode(
      Map<String, String> phoneBook, String countryCode) {
    var namesToRemove = <String>[];
    phoneBook.forEach((name, phone) {
      if (!phone.startsWith(countryCode)) {
        namesToRemove.add(name);
      }
    });

    namesToRemove.forEach((nameToDelete) {
      phoneBook.removeWhere((nameInBook, phone) => nameInBook == nameToDelete);
    });

    return phoneBook;
  }
}

///ЗАДАНИЯ:

/// Простая (2 балла)
///
/// Рассчитать среднее арифметическое элементов списка list. Вернуть 0.0, если список пуст
double mean(List<double> list) {
  defaultChecker([list]);
  return list.isEmpty
      ? 0.0
      : list.reduce((double value, double element) =>
        value + (element ?? 0.0)) / list.length;
}

/// Средняя (3 балла)
///
/// Центрировать заданный список list, уменьшив каждый элемент на среднее арифметическое всех элементов.
/// Если список пуст, не делать ничего. Вернуть изменённый список.
List<double> center(List<double> list) {
  defaultChecker([list]);
  final meanValue = mean(list);
  return list.isEmpty
      ? list
      : list.map((double element) => element == null ? element : (element - meanValue)).toList();
}

/// Средняя (3 балла)
///
/// В заданном списке list каждый элемент, кроме первого, заменить
/// суммой данного элемента и всех предыдущих.
/// Например: 1, 2, 3, 4 -> 1, 3, 6, 10.
/// Пустой список не следует изменять. Вернуть изменённый список.
List<int> accumulate(List<int> list) {
  defaultChecker([list]);
  var sum = 0;
  return list.isEmpty
      ? list
      : list.map((int element) {
        sum += (element ?? 0);
        return sum;
      }).toList();
}

/// Сложная (4 балла)
///
/// Разложить заданное натуральное число n > 1 на простые множители.
/// Результат разложения вернуть в виде строки, например 75 -> 3*5*5
/// Множители в результирующей строке должны располагаться по возрастанию.
String factorizeToString(int n) {
  defaultChecker([n]);
  if (n < 1) {
    throw NumberIsOutOfRangeException('Input value is out of range');
  }
  final List<int> numbers = [];
  var number = 2;
  while (n > 1) {
    if (n % number == 0) {
      numbers.add(number);
      n = n ~/ number;
      number = 2;
    } else {
      number++;
    }
  }
  return numbers.join('*');
}

/// Сложная (5 баллов)
///
/// Перевести натуральное число n > 0 в римскую систему.
/// Римские цифры: 1 = I, 4 = IV, 5 = V, 9 = IX, 10 = X, 40 = XL, 50 = L,
/// 90 = XC, 100 = C, 400 = CD, 500 = D, 900 = CM, 1000 = M.
/// Например: 23 = XXIII, 44 = XLIV, 100 = C
String roman(int n) {
  defaultChecker([n]);
  if (n < 0) {
    throw NumberIsOutOfRangeException('Input value is out of range');
  }
  // Significant rome numbers
  final List<Map<String, int>> romeNumbersToArabicList = [
    { 'M': 1000 },
    { 'CM': 900 },
    { 'D': 500 },
    { 'CD': 400 },
    { 'C': 100 },
    { 'XC': 90 },
    { 'L': 50 },
    { 'XL': 40 },
    { 'X': 10 },
    { 'IX': 9 },
    { 'V': 5 },
    { 'IV': 4 },
    { 'I': 1 }
  ];
  var resultString = '';
  // Subtracting each significant rome number from input
  romeNumbersToArabicList.forEach((Map<String, int> element) {
    while (n >= element.values.first) {
      resultString += element.keys.first;
      n -= element.values.first;
    }
  });
  assert(n == 0, 'n should be 0 on this stage');
  return resultString;
}

/// Простая (2 балла)
///
/// Определить, входит ли ассоциативный массив a в ассоциативный массив b;
/// это выполняется, если все ключи из a содержатся в b с такими же значениями.
bool containsIn(Map<String, String> a, Map<String, String> b) {
  defaultChecker([a, b]);
  if (a.isEmpty && !b.isEmpty) return false;
  for (var key in a.keys) {
    if (key == null) {
      throw WrongInputStateException('Key of input map should not be null');
    }
    if (a[key] != b[key]) return false;
    if (b[key] == null && !b.keys.contains(key)) return false;
  }
  return true;
}

/// Простая (2 балла)
///
/// Удалить из изменяемого ассоциативного массива все записи,
/// которые встречаются в заданном ассоциативном массиве.
/// Записи считать одинаковыми, если и ключи, и значения совпадают.
Map<String, String> subtractOf(Map<String, String> a, Map<String, String> b) {
  defaultChecker([a, b]);
  if (b.isEmpty) return a;
  for (var key in b.keys) {
    if (key == null) {
      throw WrongInputStateException('Key of input map should not be null');
    }
    if (a[key] == b[key] && !(b[key] == null && !b.keys.contains(key))) a.remove(key);
  }
  return a;
}

/// Средняя (4 балла)
///
/// Для заданного списка пар "акция"-"стоимость" вернуть ассоциативный массив,
/// содержащий для каждой акции ее усредненную стоимость.
Map<String, double> averageStockPrice(List<Map<String, double>> stockPrices) {
  defaultChecker([stockPrices]);
  if (stockPrices.isEmpty) return {};
  final Map<String, double> pricesMap = {};
  final Map<String, int> countMap = {};

  // Filling up pricesMap with sum for every item and countMap with number of repeats
  stockPrices.forEach((Map<String, double> element) {
    if (element != null) {
      final elementKey = element.keys.first;
      if (elementKey == null) {
        throw WrongInputStateException('Key of input map should not be null');
      }
      if (element.values.first != null) {
        if (pricesMap.containsKey(elementKey)) {
          pricesMap[elementKey] += (element.values.first ?? 0.0);
          countMap[elementKey]++;
        } else {
          pricesMap.addAll(element);
          countMap.addAll({ elementKey: 1});
        }
      }
    }
  });

  assert(pricesMap.length == countMap.length, 'Arrays should be the same length');
  // Getting average for every item
  for (var key in pricesMap.keys) {
    assert(pricesMap[key] != null && countMap[key] != null, 'Values of maps should not be null');
    pricesMap[key] = pricesMap[key] / countMap[key];
  }
  return pricesMap;
}

/// Средняя (4 балла)
///
/// Найти в заданном списке повторяющиеся элементы и вернуть
/// ассоциативный массив с информацией о числе повторений
/// для каждого повторяющегося элемента.
/// Если элемент встречается только один раз, включать его в результат
/// не следует.
Map<String, int> extractRepeats(List<String> list) {
  defaultChecker([list]);
  final Map<String, int> map = {};
  list.forEach((String element) {
    if (!map.containsKey(element)) {
      map.addAll({ element: 1 });
    } else {
      map[element]++;
    }
  });
  // Adding copy of keys to new List for preventing changing item while iterating
  final keys = List.of(map.keys);
  for (var key in keys) {
    if (map[key] == 1) {
      map.remove(key);
    }
  }
  return map;
}

/// Сложная (5 баллов)
///
/// Для заданного ассоциативного массива знакомых через одно рукопожатие `friends`
/// необходимо построить его максимальное расширение по рукопожатиям, то есть,
/// для каждого человека найти всех людей, с которыми он знаком через любое
/// количество рукопожатий.
///
/// Считать, что все имена людей являются уникальными, а также что рукопожатия
/// являются направленными, то есть, если Марат знает Свету, то это не означает,
/// что Света знает Марата.
///
/// Оставлять пустой список знакомых для людей, которые их не имеют (см. EvilGnome ниже),
/// в том числе для случая, когда данного человека нет в ключах, но он есть в значениях
/// (см. GoodGnome ниже).
///
/// Например:
///   propagateHandshakes(
///     {
///       "Marat" : ["Mikhail", "Sveta"],
///       "Sveta" : ["Marat"],
///       "Mikhail" : ["Sveta"],
///       "Friend" : ["GoodGnome"],
///       "EvilGnome" : []
///     }
///   ) -> {
///          "Marat" : ["Mikhail", "Sveta"],
///          "Sveta" : ["Marat", "Mikhail"],
///          "Mikhail" : ["Sveta", "Marat"],
///          "Friend" : ["GoodGnome"),
///          "EvilGnome" : [],
///          "GoodGnome" : []
///        }
Map<String, Set<String>> propagateHandshakes(Map<String, Set<String>> friends) {
  defaultChecker([friends]);
  final Set<String> allPersons = {};

  /// Recursion of finding friends
  Set<String> findFriends(Map<String, Set<String>> friends, String person, List<String> skipPersons) {
    assert(friends != null && person != null && skipPersons != null, 'Input values should not be null');
    if (!allPersons.contains(person)) {
      allPersons.add(person);
    }
    if (friends[person] == null) return {};
    final Set<String> set = {};
    friends[person].forEach((String element) {
      if (element == null) {
        throw WrongInputStateException('Contacts should not contain null values');
      }
      if (!skipPersons.contains(element)) {
        skipPersons.add(element);
        set.add(element);
        set.addAll(findFriends(friends, element, skipPersons));
      }
    });
    return set;
  };

  final Map<String, Set<String>> map = {};
  // Forming map of contacts
  for (var person in friends.keys) {
    if (person == null) {
      throw WrongInputStateException('Key of input map should not be null');
    }
    if (!allPersons.contains(person)) {
      allPersons.add(person);
    }
    map.addAll({ person: findFriends(friends, person, [person]) });
  }
  // Adding persons that are not in map with empty set
  for (var person in allPersons) {
    assert(person != null, 'Value should not be null');
    if (!map.containsKey(person)) {
      map.addAll({ person: {} });
    }
  }
  return map;
}

/// Очень сложная (8 баллов)
///
/// Входными данными является ассоциативный массив
/// "название сокровища"-"пара (вес сокровища, цена сокровища)"
/// и вместимость вашего рюкзака.
/// Необходимо вернуть множество сокровищ с максимальной суммарной стоимостью,
/// которые вы можете унести в рюкзаке.
///
/// Перед решением этой задачи лучше прочитать статью Википедии "Динамическое программирование".
///
/// Например:
///   bagPacking(
///     {"Кубок" : {500 : 2000}, "Слиток" : {1000 : 5000}},
///     850
///   ) -> ["Кубок"]
///   bagPacking(
///     {"Кубок" : {500 : 2000}, "Слиток" : {1000 : 5000}},
///     450
///   ) -> []
Set<String> bagPacking(Map<String, Map<int, int>> treasures, int capacity) {
  // Алгоритм поиска максимального вэлью не мой, прочитал текстовое решение в статье про динамическое программирование
  // и написал нижеприведенный код по текстовому описанию
  // + связал для каждого значения сэт айтемов, из которых получается это значение, чтобы двть ответ на задачу

  defaultChecker([treasures, capacity]);
  List<List<int>> valueList = List.filled(treasures.length, List.filled(capacity, 0));
  List<List<Set<String>>> itemList = List.filled(treasures.length, List.filled(capacity, {}));
  // Iterating over all possible items count for all possible weights
  for (var i = 0; i < treasures.keys.length; i++) {
    for (var j = 0; j < capacity; j++) {
      final mapIsNull = treasures.values.elementAt(i) == null;
      final mapKeyIsNull = treasures.values.elementAt(i).keys.first == null;
      final mapElementIsNull = treasures.values.elementAt(i).values.first == null;
      if (mapIsNull || mapKeyIsNull || mapElementIsNull) {
        throw WrongInputStateException('Input map elements have incorrect state');
      }
      // If current item is too heavy - assign value of prev items set
      // Else assign max of prev items set or prev items set plus current item
      if (treasures.values.elementAt(i).keys.first > j) {
        valueList[i][j] = i == 0 ? 0 : valueList[i - 1][j];
        itemList[i][j] = i == 0 ? {} : itemList[i - 1][j];
      } else {
        final prevValue = i == 0 ? 0 : valueList[i - 1][j];
        final currValue = i == 0 ? 0 : valueList[i - 1][j - treasures.values.elementAt(i).keys.first]
            + treasures.values.elementAt(i).values.first;
        if (prevValue > currValue) {
          valueList[i][j] = prevValue;
          itemList[i][j] = i == 0 ? {} : itemList[i - 1][j];
        } else {
          valueList[i][j] = currValue;
          itemList[i][j] = i == 0 ? {} : Set.of(itemList[i - 1][j - treasures.values.elementAt(i).keys.first]);
          itemList[i][j].add(treasures.keys.elementAt(i));
        }
      }
    }
  }
  return itemList.last.last;
}

// Exceptions
class NumberIsOutOfRangeException implements Exception {
  String msg;
  NumberIsOutOfRangeException(this.msg);
}

class InputValueIsNullException implements Exception {
  String msg;
  InputValueIsNullException(this.msg);
}

class WrongInputStateException implements Exception {
  String msg;
  WrongInputStateException(this.msg);
}

// utils
void defaultChecker(List list) {
  for (var element in list) {
    if (element == null) {
      throw InputValueIsNullException('Input value is null, but not-null value expected');
    }
  }
}
