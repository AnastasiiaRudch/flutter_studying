void main() async {
  final name = await task1FetchName();
  print('Мене звати $name\n');

  for (int i = 20; i <= 30; i++) {
    final age = await task2FetchAge(i);
    print('Мені $age ${_getYearWord(age)}');
  }

  await task3();
  await task4();
  final result = await task5delayedCountdown(3);
  print(result);
}

//Частина 1: Future
Future<String> task1FetchName() async {
// Task 1: Асинхронне отримання імені
//
// Створіть метод Future<String> fetchName(), який імітує асинхронну операцію.
// Цей метод повинен повертати ваше ім'я через 2 секунди (використайте Future.delayed та async/await).
// Виведіть результат у консоль у форматі: "Мене звати [результат виконання асинхронної операції]".

  await Future.delayed(const Duration(seconds: 2));
  return 'Anastasiia';
}

Future<int> task2FetchAge(int age) async {
//Task 2: Асинхронне отримання віку
//
// Створіть метод Future<String> fetchAge(), який імітує асинхронну операцію.
// Цей метод повинен повертати рядок "25" через 1500 мілісекунд.
// Виведіть результат у консоль у форматі: "Мені [ваш вік] років".
// Реалізуйте логіку, щоб слово "рік" змінювалося відповідно до значення віку (наприклад: 21 рік, 22 роки, 25 років).

  await Future.delayed(const Duration(milliseconds: 1500));
  return age;
}

String _getYearWord(int age) {
  if (age % 100 >= 11 && age % 100 <= 14) return 'років';

  int lastDigit = age % 10;

  if (lastDigit == 1) return 'рік';
  if (lastDigit >= 2 && lastDigit <= 4) return 'роки';

  return 'років';
}

Future<void> task3() async {
//Task 3: Послідовне виконання Future
//
// Виконайте методи fetchName() та fetchAge() послідовно.
// Виміряйте та виведіть час виконання обох методів.
// Порада. Можете використати для виконання другого пункту клас https://api.flutter.dev/flutter/dart-core/Stopwatch-class.html

  final stopwatch = Stopwatch()..start();

  final name = await task1FetchName();
  print(name);
  final age = await task2FetchAge(25);
  print('$age');

  stopwatch.stop();
  print(
      'Час виконання: ${stopwatch.elapsedMilliseconds} мс\n'); //Час виконання: 3515 мс
}

Future<void> task4() async {
//Task 4: Паралельне виконання Future (Future.wait)
//
// Виконайте методи fetchName() та fetchAge() паралельно за допомогою Future.wait.
// Виміряйте та виведіть час виконання.

  final stopwatch = Stopwatch()..start();

  final results = await Future.wait([task1FetchName(), task2FetchAge(21)]);
  final name = results[0] as String;
  final age = results[1] as int;

  print('$name, $age');

  stopwatch.stop();
  print(
      'Час виконання: ${stopwatch.elapsedMilliseconds} мс'); //Час виконання: 2004 мс
}

Future<String> task5delayedCountdown(int seconds) async {
//Task 5: Зворотний відлік з затримкою
//
// Напишіть функцію Future<String> delayedCountdown(int seconds), яка приймає кількість секунд.
// Ця функція повинна щосекунди виводити у консоль відлік (наприклад: "3...", "2...", "1...").
// В кінці відліку метод має повертати рядок "Старт!".

  for (int i = seconds; i > 0; i--) {
    print('$i...');
    await Future.delayed(const Duration(seconds: 1));
  }

  return 'Start!';
}
