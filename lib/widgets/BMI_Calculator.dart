import 'dart:math';

class BmiBrain {
  BmiBrain({
    required this.height,
    required this.weight,
  });

  final int height;
  final int weight;
  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String generalStatus() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 18.5) {
      return 'normal';
    } else {
      return 'Underweight';
    }
  }

  String recomandation() {
    if (_bmi >= 25) {
      return 'You have a higher body weight. Do exercise!';
    } else if (_bmi > 18.5) {
      return 'You have normal body weight, Good Job!';
    } else {
      return 'You have lower body weight. Eat a little bit more';
    }
  }
}
