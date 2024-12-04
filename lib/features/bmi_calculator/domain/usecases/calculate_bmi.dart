import 'package:bmi_calculator/features/bmi_calculator/domain/entities/bmi_entity.dart';
import 'package:bmi_calculator/features/bmi_calculator/domain/repositories/bmi_repository.dart';

class CalculateBmi {
  final BmiRepository _bmiRepository;

  CalculateBmi(this._bmiRepository);
  BmiEntity call(double weight, double height, int age) {
    {
      return _bmiRepository.calculateBmi(weight, height, age);
    }
  }
}
