import 'dart:math';

void main() {
  task1Rectangle();
  task2Comparison();
  print('');
  task3LogicalOperators();
  print('');
  task4TernaryOperator();
  print('');
  task5AssignmentOperators();
  print('');
  task6ConditionalConstructs();
  print('');
  task7Switch();
  print('');
  task8For();
  print('');
  task9While();
  print('');
  task10BreakContinue();
}

void task1Rectangle() {
  double width = 18.4;
  double length = 30.9;

  double S = width * length;
  double P = 2 * (width + length);
  int fullSquares = S ~/ 1;

  print('Площа: $S');
  print('Периметр: $P');
  print('fullSquares: $fullSquares\n');
}

void task2Comparison() {
  final random = Random();
  int number = random.nextInt(200);

  if (number > 50) {
    print('$number is bigger than 50');
  }
  if (number < 100) {
    print('$number  is less than 100');
  }
  if (number % 5 == 0) {
    print('$number is divisible by 5');
  }
}

void task3LogicalOperators() {
  final random = Random();

  bool hasMoney = random.nextBool();
  bool isStoreOpen = random.nextBool();

  print('Has money: $hasMoney');
  print('Is store open: $isStoreOpen');

  if (hasMoney && isStoreOpen) {
    print('You can buy goods');
  } else if (!hasMoney || !isStoreOpen) {
    print(
        'Unfortunately, you cant buy goods: You dont have money or the store is closed');
  }

  //Correct would be write: (just if else)
  // if(hasMoney && isStoreOpen){
  //   print('You can buy goods');
  // }else{
  //   print('Unfortunately, you cant buy goods');
  // }
}

void task4TernaryOperator() {
  final random = Random();
  int temperature = random.nextInt(51) - 15;

  String weather = temperature > 25 ? 'Warm' : 'Cool';
  print('Temperature: $temperature, The weather is: $weather');

  String extra = temperature < 10 ? 'Very cold' : '';
  if (extra != '') {
    print(extra);
  }
}

void task5AssignmentOperators() {
  int score = 0;
  int correctAnswers = 17;
  int mistakes = 3;
  int totalQuestions = 20;

  score += correctAnswers * 10;
  score -= mistakes * 5;
  score *= 2;
  double finalScore = score / totalQuestions;

  print('Final score: $finalScore');
}

void task6ConditionalConstructs() {
  final random = Random();
  int examScore = random.nextInt(100);

  if (examScore > 90) {
    print('Оцінка: $examScore, Відмінно');
  } else if (examScore >= 75 && examScore <= 90) {
    print('Оцінка: $examScore, Добре');
  } else if (examScore >= 60 && examScore < 75) {
    print('Оцінка: $examScore, Задовільно');
  } else if (examScore < 20) {
    print('Оцінка: $examScore, Повторити курс');
  } else {
    print('Оцінка: $examScore, Не здано');
  }
}

void task7Switch() {
  final random = Random();
  int dayNumber = random.nextInt(10);
  print('dayNumber: $dayNumber');

  switch (dayNumber) {
    case 1:
      print('Monday');
    case 2:
      print('Tuesday');
    case 3:
      print('Wednesday');
    case 4:
      print('Thursday');
    case 5:
      print('Friday');
    case 6:
      print('Saturday');
      print('Weekday 🎉');
    case 7:
      print('Sunday');
      print('Weekday 🎉');
    default:
      print('Wrong day number');
  }
}

void task8For() {
  for (int i = 1; i <= 10; i++) {
    print('Number: $i');
  }

  print('\nEven');
  for (int i = 1; i <= 10; i++) {
    if (i % 2 == 0) {
      print('Number: $i');
    }
  }

  print('\nSum');
  int sum = 0;
  for (int i = 1; i <= 10; i++) {
    sum += i;
  }
  print('Sum: $sum');
}

void task9While() {
  int num = 10;

  while (num > 0) {
    print('\nnum: $num');

    if (num % 2 == 0) {
      print('Its an even number');
    } else {
      print('Its an odd number');
    }

    num--;
  }
}

void task10BreakContinue() {
  for (int i = 1; i <= 20; i++) {
    if (i % 3 == 0) {
      continue;
    } else if (i > 15) {
      break;
    }
    print('i: $i');
  }
}
