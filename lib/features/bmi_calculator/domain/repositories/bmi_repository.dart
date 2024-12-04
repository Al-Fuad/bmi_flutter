import 'package:bmi_calculator/features/bmi_calculator/domain/entities/bmi_entity.dart';

abstract class BmiRepository {
  BmiEntity calculateBmi(double weight, double height, int age);
}