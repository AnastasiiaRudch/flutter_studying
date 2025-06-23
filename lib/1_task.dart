void main() {
  task1_rectangle();
}

void task1_rectangle(){

  double width = 18.4;
  double length = 30.9;

  double S = width * length;
  double P = 2 * (width + length);
  int fullSquares = S ~/ 1;

  print('Площа: $S');
  print('Периметр: $P');
  print('fullSquares: $fullSquares');

