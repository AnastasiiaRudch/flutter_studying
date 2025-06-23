import 'dart:math';

void main() {
  task1_rectangle();
  task2_comparison();
  print('');
  task3_logical_operators();
  print('');
  task4_ternary_operator();
  print('');
  task5_assignment_operators();
  print('');
  task6_conditional_constructs();
}

void task1_rectangle() {
  double width = 18.4;
  double length = 30.9;

  double S = width * length;
  double P = 2 * (width + length);
  int fullSquares = S ~/ 1;

  print('Площа: $S');
  print('Периметр: $P');
  print('fullSquares: $fullSquares\n');
}

void task2_comparison() {
  final random = new Random();
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

void task3_logical_operators() {
  final random = new Random();

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

void task4_ternary_operator() {
  final random = new Random();
  int temperature = random.nextInt(51) - 15;

  String weather = temperature > 25 ? 'Warm' : 'Cool';
  print('Temperature: $temperature, The weather is: $weather');

  String extra = temperature < 10 ? 'Very cold' : '';
  if (extra != '') {
    print('$extra');
  }
}

void task5_assignment_operators() {
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

void task6_conditional_constructs() {

  final random = new Random();
  int examScore = random.nextInt(100);

  if(examScore > 90){
    print('Оцінка: $examScore, Відмінно');
  }else if(examScore >= 75 && examScore <= 90){
    print('Оцінка: $examScore, Добре');
  }else if(examScore >= 60 && examScore < 75){
    print('Оцінка: $examScore, Задовільно');
  } else if (examScore < 20) {
    print('Оцінка: $examScore, Повторити курс');
  } else {
    print('Оцінка: $examScore, Не здано');
  }

}
