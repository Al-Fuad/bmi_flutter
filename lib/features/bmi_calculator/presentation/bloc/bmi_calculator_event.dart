part of 'bmi_calculator_bloc.dart';

abstract class BmiCalculatorEvent {}

class CalculateBmiEvent extends BmiCalculatorEvent {


  CalculateBmiEvent();
}

class UpdateWeightEvent extends BmiCalculatorEvent {
  final double weight;

  UpdateWeightEvent(this.weight);
}

class UpdateHeightEvent extends BmiCalculatorEvent {
  final double height;

  UpdateHeightEvent(this.height);
}

class UpdateAgeEvent extends BmiCalculatorEvent {
  final int age;

  UpdateAgeEvent(this.age);
}

class UpdateHeightUnitEvent extends BmiCalculatorEvent {
  final String? unit;

  UpdateHeightUnitEvent({this.unit = 'f/in'});
}

class UpdateWeightUnitEvent extends BmiCalculatorEvent {
  final String? unit;

  UpdateWeightUnitEvent({this.unit = 'kg'});
}
