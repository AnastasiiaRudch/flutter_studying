import 'dart:math';

void main() {
  task1_rectangle();
  task2_comparison();
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

void task2_comparison(){
  final random = new Random();
  int number = random.nextInt(200);

  if(number > 50){
    print('$number is bigger than 50');
  }
  if(number < 100){
    print('$number  is less than 100');
  }
  if(number % 5 == 0){
    print('$number is divisible by 5\n');
  }

}
