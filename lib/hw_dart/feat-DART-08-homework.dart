import 'dart:math';
import '../hw_dart/names.dart';
import 'package:word_generator/word_generator.dart';

void main() {
  runTask1List();
  runTask2Set();
  runTask3Map();
}

void runTask1List(){
  //Створіть список numbers зі 100 елементів. Кожен елемент — випадкове число від 0 до 100 (використайте Random().nextInt(101)).
  final random = Random();
  List<int> numbers = List.generate(100, (_) => random.nextInt(101));
  print(numbers);

  //Виведіть на екран 65-й елемент списку у форматі: "65-й елемент: [значення]".
  int index = 65;
  int value = numbers[65];
  print('$index-й елемент: [$value]');

  print('***');
  //Вставте число 1000000000 на 50-ту позицію списку.
  numbers.insert(50, 1000000000);
  print(numbers);

  print('***');
  //Видаліть зі списку елементи зі значеннями: 24, 45, 66, 88.
  numbers.removeWhere((el) => el == 24 || el == 45 || el == 66 || el == 88);
  print(numbers.length);

  print('***');
  //За допомогою циклу for переберіть список. Під час перебору:
  // Порахуйте суму всіх елементів, що діляться на 3 без залишку.
  // Виведіть результат.

  int sum = 0;
  for(var el in numbers){
    if(el %3 == 0){
      print('el %3 : $el');
      sum += el;
    }
  }
  print(numbers);
  print(sum);

  print('***');
  //Створіть порожній список temp. За допомогою циклу for-in переберіть numbers.
  // Додайте до temp лише ті елементи, що діляться на 2 без залишку.
  // Виведіть довжину списку temp.

  List<int> temp = [];
  for(var el in numbers){
    if(el %2 == 0){
      print('el %2 : $el');
      temp.add(el);
    }
  }
  print(temp);
  print(temp.length);

}

void runTask2Set(){
// Створіть Set uniqueNames1 і додайте до нього всі імена з ukrainianNames1.
// Створіть Set uniqueNames2 і додайте до нього всі імена з ukrainianNames2.

  Set<String> uniqueNames1 = Set.from(ukrainianNames1);
  Set<String> uniqueNames2 = Set.from(ukrainianNames2);
  print('uniqueNames1: $uniqueNames1');
  print('uniqueNames2: $uniqueNames2\n');

// Створіть новий Set зі спільними іменами обох списків. Виведіть кількість елементів у цій множині.

  Set<String> commonNames = uniqueNames1.intersection(uniqueNames2);
  print('commonNames: $commonNames');
  print(commonNames.length);

// Створіть множину з іменами, що є в uniqueNames1, але яких немає в uniqueNames2. Виведіть ці імена.
  Set<String> difference = uniqueNames1.difference(uniqueNames2);
  print('difference uniqueNames1 - uniqueNames2: $difference');
  print('In uniqueNames1 only: ${difference.length}');

// Створіть множину з іменами, що є в uniqueNames2, але яких немає в uniqueNames1. Виведіть ці імена.
  Set<String> difference2 = uniqueNames2.difference(uniqueNames1);
  print('difference uniqueNames2 - uniqueNames1: $difference2');
  print('In uniqueNames2 only: ${difference2.length}');

}

void runTask3Map(){
//Створіть список nounsList із 50 випадкових слів (як це зробити, дивіться в документації: https://pub.dev/packages/word_generator#randomnouns).

  final wordGenerator = WordGenerator();
  List<String> nounsList = wordGenerator.randomNouns(50);
  print(nounsList);

// Із nounsList створіть Map<String, int> nounsMap, де:
// ключ — слово;
// значення — кількість символів у цьому слові.

  Map<String, int> nounsMap = {};
  for (var word in nounsList) {
    nounsMap[word] = word.length;
  }
  print(nounsMap);

// Створіть нову змінну Map<String, int> tempNouns.
// Додайте у tempNouns лише ті пари зі nounsMap, де довжина слова — парне число.
// Виведіть всі ключі зі tempNouns.

  print('***');
  Map<String, int> tempNouns = {};
  for(var entry in nounsMap.entries){
    if(entry.value %2 == 0){
      tempNouns[entry.key] = entry.value;
    }
  }

  print('tempNouns: $tempNouns');
  print('Keys from tempNouns: ${tempNouns.keys.join(', ')}');

}
