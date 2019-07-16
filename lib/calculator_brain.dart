import 'dart:math';

class Calculator_brain {
  final height;
  final weight;
  double _bmi;
  Calculator_brain({this.height, this.weight});

  String calculateBmi() {
    double _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25)
      return 'Overweight';
    else if (_bmi > 18.5)
      return 'underweight';
    else
      return 'Underweight';
  }

  String InterpreTation() {
    if (_bmi >= 25)
      return 'xyz';
    else if (_bmi > 18.5)
      return 'abc';
    else
      return 'efg';
  }
}
