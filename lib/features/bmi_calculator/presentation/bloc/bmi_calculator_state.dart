part of 'bmi_calculator_bloc.dart';

abstract class BmiCalculatorState extends Equatable {
  final double weight;
  final double height;
  final int age;
  final String heightUnit;
  final String weightUnit;

  const BmiCalculatorState({this.heightUnit = 'f/in', this.weightUnit = 'kg', this.weight = 60.0, this.height = 60, this.age = 21});
  @override
  List<Object?> get props => [weight, height, age, heightUnit, weightUnit];
}

class BmiCalculatorInitial extends BmiCalculatorState {}

class ValueUpdated extends BmiCalculatorState {

  const ValueUpdated({required super.weight, required super.height, required super.age, required super.heightUnit, required super.weightUnit});

  @override
  List<Object?> get props => [weight, height, age, heightUnit, weightUnit];
}

class BmiCalculated extends BmiCalculatorState {
  final double bmiValue;
  final String category;

  const BmiCalculated({
    required super.weight,
    required super.height,
    required super.age,
    required this.bmiValue,
    required this.category,
  });

  @override
  List<Object?> get props => [bmiValue, category, weight, height, age, heightUnit, weightUnit];

  Map<String, dynamic> toJson() => {
    'bmiValue': bmiValue.toStringAsFixed(2),
    'category': category,
    'weight': weight.toStringAsFixed(2),
    'height': height.toStringAsFixed(2),
    'age': age,
  };


}
