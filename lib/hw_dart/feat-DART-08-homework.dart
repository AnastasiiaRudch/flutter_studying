import 'dart:math';


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

}

void runTask3Map(){

}
