import 'package:bmi_calculator/features/bmi_calculator/domain/entities/bmi_entity.dart';
import 'package:bmi_calculator/features/bmi_calculator/domain/repositories/bmi_repository.dart';

class BmiRepositoryImpl implements BmiRepository {
  @override
  BmiEntity calculateBmi(double weight, double height, int age) {
    final bmiValue = 1550 * weight / (height * height);
    String category;

    if (bmiValue < 16 && age >= 20) {
      category = 'Severe Thinness';
    } else if (bmiValue < 17 && age >= 20) {
      category = 'Moderate Thinness';
    } else if (bmiValue < 18.5 && age >= 20) {
      category = 'Mild Thinness';
    } else if (bmiValue < 18.5 && age < 20) {
      category = 'Underweight';
    } else if (bmiValue < 25) {
      category = 'Normal weight';
    } else if (bmiValue < 30) {
      category = 'Overweight';
    } else if (bmiValue > 40 && age >= 20) {
      category = 'Obese Class III';
    } else if (bmiValue > 35 && age >= 20) {
      category = 'Obese Class II';
    } else if (bmiValue > 30 && age >= 20) {
      category = 'Obese Class I';
    } else {
      category = 'Obesity';
    }

    return BmiEntity(value: bmiValue, category: category);
  }
}
