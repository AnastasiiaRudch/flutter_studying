import 'dart:async';

void main() async {
  await task6();
  task7();
  await task8();
}

//Частина 2: Streams

Future<void> task6() async {
  //Task 6: Стрім з чисел (fromIterable)
  //
  // Створіть Stream<int> з довільних чисел (наприклад, від 1 до 5) за допомогою Stream.fromIterable.
  // Виведіть кожне значення з цього стріму, використовуючи конструкцію await for.
  // Виведіть кожне значення з цього ж стріму, використовуючи метод listen.

  final Stream<int> stream = Stream.fromIterable([1, 2, 3, 4, 5]);
  await for (final value in stream) {
    print('await: $value');
  }

  stream.listen((value) {
    print('listen: $value');
  });
}

void task7() {
//Task 7: Зворотний відлік зі стріму (periodic)
//
// Створіть Stream<int> за допомогою Stream.periodic, який генерує числа з затримкою в 1 секунду.
// Обмежте відлік до 10 чисел за допомогою методу take.
// Виведіть кожне число у консоль у форматі: "1...", "2...", "3...", ... "10...".

  final Stream<int> stream =
      Stream.periodic(const Duration(seconds: 1), (count) => count + 1)
          .take(10);

  stream.listen((value) {
    print('$value...');
  });
}

Future<void> task8() async {
//Task 8: Робота з StreamController
//
// Створіть StreamController<String>.
// Додайте до цього контролера кілька довільних рядкових значень вручну (наприклад, "Hello", "World", "Dart").
// Прослухайте цей стрім (через метод listen) і виведіть всі значення у консоль.
// Закрийте контролер після додавання всіх значень.
// Використайте callback onDone у методі listen, щоб вивести повідомлення "Стрім завершено" після того, як стрім буде закритий.

  final controller = StreamController<String>();

  controller.stream.listen(
    (data) {
      print(data);
    },
    onDone: () {
      print('Стрім завершено');
    },
  );

  controller.add('Hello');
  controller.add('World');
  controller.add('Dart');

  await controller.close();
}
