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
  //Делаем проверку на наличие элементов в списке
  if (list.isEmpty) {
    return 0.0;
  } else {
    double sum = list.reduce((a, b) => a + b);
    return sum / list.length;
  }
}

/// Средняя (3 балла)
///
/// Центрировать заданный список list, уменьшив каждый элемент на среднее арифметическое всех элементов.
/// Если список пуст, не делать ничего. Вернуть изменённый список.
List<double> center(List<double> list) {
  List<double> newList = [];

  //Делаем проверку на наличие элементов в списке
  if (list.isEmpty)
    return [];
  else {
    for (var elem in list) {
      //Используем ф-цию mean() из предыдущего задания для подсчета ср. арифм.
      elem -= mean(list);
      newList.add(elem);
    }
    print(list);
    return newList;
  }
}

/// Средняя (3 балла)
///
/// В заданном списке list каждый элемент, кроме первого, заменить
/// суммой данного элемента и всех предыдущих.
/// Например: 1, 2, 3, 4 -> 1, 3, 6, 10.
/// Пустой список не следует изменять. Вернуть изменённый список.
List<int> accumulate(List<int> list) {
  //Делаем проверку на наличие элементов в списке

  if (list.isEmpty)
    return [];
  else {
    //newList - результирующий список
    //sumList - равен list (повторяет все его изменения), но с элементами в обратном порядке
    List<int> newList = [];
    List<int> sumList = [];

    int sum;
    //Конечная длина исходного списка - фиксированная величина
    final length = list.length;

    for (var i = 0; i < length; i++) {
      sumList = list;
      sumList.reversed.toList();
      sum = sumList.reduce((a, b) => a + b);
      list.removeLast();
      newList.add(sum);
    }

    return newList.reversed.toList();
  }
}

/// Сложная (4 балла)
///
/// Разложить заданное натуральное число n > 1 на простые множители.
/// Результат разложения вернуть в виде строки, например 75 -> 3*5*5
/// Множители в результирующей строке должны располагаться по возрастанию.
String factorizeToString(int n) {
  //Проверка условия n > 1

  if (n > 1) {
    int div = 2;
    List<int> multipliers = [];
    while (n > 1) {
      while (n % div == 0) {
        multipliers.add(div);
        n ~/= div;
      }
      div++;
    }
    return multipliers.join('*');
  } else {
    return "No multipliers";
  }
}

/// Сложная (5 баллов)
///
/// Перевести натуральное число n > 0 в римскую систему.
/// Римские цифры: 1 = I, 4 = IV, 5 = V, 9 = IX, 10 = X, 40 = XL, 50 = L,
/// 90 = XC, 100 = C, 400 = CD, 500 = D, 900 = CM, 1000 = M.
/// Например: 23 = XXIII, 44 = XLIV, 100 = C
String roman(int n) {
  if (n > 0) {
    List<String> rims = [
      'M',
      'CM',
      'D',
      'CD',
      'C',
      'XC',
      'L',
      'XL',
      'X',
      'IX',
      'V',
      'IV',
      'I'
    ];
    List<int> arabs = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
    String arab2Rim = '';
    int i = 0;

    //Разложение числа на слогаемые (т.е. цифры, эквивалентные римской системе)
    while (n > 0) {
      while (arabs[i] <= n) {
        arab2Rim += rims[i];
        n -= arabs[i];
      }
      i++;
    }
    return arab2Rim;
  } else
    return 'n < 0';
}

/// Простая (2 балла)
///
/// Определить, входит ли ассоциативный массив a в ассоциативный массив b;
/// это выполняется, если все ключи из a содержатся в b с такими же значениями.
bool containsIn(Map<String, String> a, Map<String, String> b) {
  bool answer = true;
  a.forEach((key, value) {
    //если в мэпе б есть ключ из мэпа а, тогда будут сравниваться
    //их значения
    if (b.containsKey(key)) {
      if (value != b[key]) answer = false;
    }
  });

  return answer;
}

/// Простая (2 балла)
///
/// Удалить из изменяемого ассоциативного массива все записи,
/// которые встречаются в заданном ассоциативном массиве.
/// Записи считать одинаковыми, если и ключи, и значения совпадают.
Map<String, String> subtractOf(Map<String, String> a, Map<String, String> b) {
  //проверяем пусты ли списки
  if (!b.isEmpty || !a.isEmpty) {
    b.forEach((key, value) {
      if (a.containsKey(key)) {
        if (a[key] == value) {
          a.remove(key);
        }
      }
    });
  }
  return a;
}

/// Средняя (4 балла)
///
/// Для заданного списка пар "акция"-"стоимость" вернуть ассоциативный массив,
/// содержащий для каждой акции ее усредненную стоимость.
Map<String, double> averageStockPrice(List<Map<String, double>> stockPrices) {
  Map<String, int> stockUniqueCount = {};
  Map<String, double> stockSum = {};
  Map<String, double> average = {};

  for (var i = 0; i < stockPrices.length; i++) {
    stockPrices[i].forEach((key, value) {
      if (!stockUniqueCount.containsKey(key)) {
        stockUniqueCount[key] = 1;
        stockSum[key] = value;
      } else {
        stockUniqueCount[key]++;
        stockSum[key] += value;
      }
    });
  }

  stockUniqueCount.forEach((keyCount, valueCount) {
    stockSum.forEach((keySum, valueSum) {
      if (keyCount == keySum) {
        average[keySum] = valueSum / valueCount;
      }
    });
  });

  return average;
}

/// Средняя (4 балла)
///
/// Найти в заданном списке повторяющиеся элементы и вернуть
/// ассоциативный массив с информацией о числе повторений
/// для каждого повторяющегося элемента.
/// Если элемент встречается только один раз, включать его в результат
/// не следует.
Map<String, int> extractRepeats(List<String> list) {
  List<String> unique = list.toSet().toList();
  Map<String, int> repeats = {};

  //Если входной список пуст, то сразу возвращаем пустой map
  if (list.isEmpty) {
    return {};
  } else {
    int count = 0;
    unique.forEach((element) {
      for (var i = 0; i < list.length; i++) {
        if (element == list[i]) count++;
      }
      //Если элемент встречается только один раз или не встречается вовсе,
      //то он в список не добавляется
      if (count > 1) repeats[element] = count;
      count = 0;
    });

    return repeats;
  }
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
  //Непонятно со вторым тестом 'Friend' : {'GoodGnome'}
  //Friend должен заноситься в результирующий список с пустым сетом,
  //т.к. его нет в знакомых среди остальных ключей,
  //однако этого не происходит...

  Map<String, Set<String>> friends2 = friends;
  Set<String> names = {};
  List<String> keys = friends.keys.toList();
  Map<String, Set<String>> unknown = {};
  // Map<String, Set<String>> known = {};

  friends.forEach((key, value) {
    value.forEach((element) {
      if (friends2.containsKey(element)) {
        friends2[element].forEach((name) {
          if (name != key) names.add(name);
        });
      }
    });
    value.addAll(names);
    names = {};
  });
  int count = 0;
  int knownCount = 0;
  bool knownBool = false;
  for (var i = 0; i < keys.length; i++) {
    count = 0;
    knownCount = 0;
    friends.forEach((key, value) {
      for (var match in value) {
        if (match == keys[i]) {
          count++;
        }
        knownCount++;
      }
      if (knownCount == value.length && !knownBool) {
        knownBool = true;
      }
    });

    if (count == 0) unknown[keys[i]] = {};
  }

  print('unknown - ${unknown}');

  friends.addAll(unknown);

  return friends;
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
  //TODO
}
