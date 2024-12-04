import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/features/bmi_calculator/domain/usecases/calculate_bmi.dart';
import 'package:equatable/equatable.dart';

part 'bmi_calculator_event.dart';
part 'bmi_calculator_state.dart';

class BmiCalculatorBloc extends Bloc<BmiCalculatorEvent, BmiCalculatorState> {
  final CalculateBmi _calculateBmi;
  BmiCalculatorBloc(this._calculateBmi) : super(BmiCalculatorInitial()) {
    on<CalculateBmiEvent>(_calculateBmiEvent);
    on<UpdateHeightEvent>(_updateHeightEvent);
    on<UpdateWeightEvent>(_updateWeightEvent);
    on<UpdateAgeEvent>(_updateAgeEvent);
    on<UpdateHeightUnitEvent>(_updateHeightUnitEvent);
    on<UpdateWeightUnitEvent>(_updateWeightUnitEvent);
  }

  FutureOr<void> _calculateBmiEvent(
      CalculateBmiEvent event, Emitter<BmiCalculatorState> emit) {
    emit(ValueUpdated(
        height: state.height,
        weight: state.weight,
        age: state.age,
        heightUnit: state.heightUnit,
        weightUnit: state.weightUnit));
    final bmi = _calculateBmi.call(double.parse(state.weight.toStringAsFixed(2)), state.height.floorToDouble(), state.age);
    emit(BmiCalculated(
        bmiValue: bmi.value,
        category: bmi.category,
        weight: state.weight,
        height: state.height,
        age: state.age));
  }

  FutureOr<void> _updateHeightEvent(
      UpdateHeightEvent event, Emitter<BmiCalculatorState> emit) {
    emit(ValueUpdated(
        height: event.height,
        weight: state.weight,
        age: state.age,
        heightUnit: state.heightUnit,
        weightUnit: state.weightUnit));
  }

  FutureOr<void> _updateWeightEvent(
      UpdateWeightEvent event, Emitter<BmiCalculatorState> emit) {
    emit(ValueUpdated(
        weight: event.weight,
        height: state.height,
        age: state.age,
        heightUnit: state.heightUnit,
        weightUnit: state.weightUnit));
  }

  FutureOr<void> _updateAgeEvent(
      UpdateAgeEvent event, Emitter<BmiCalculatorState> emit) {
    emit(ValueUpdated(
        weight: state.weight,
        height: state.height,
        age: event.age,
        heightUnit: state.heightUnit,
        weightUnit: state.weightUnit));
  }

  FutureOr<void> _updateHeightUnitEvent(
      UpdateHeightUnitEvent event, Emitter<BmiCalculatorState> emit) {
    emit(ValueUpdated(
        weight: state.weight,
        height: state.height,
        age: state.age,
        heightUnit: event.unit!,
        weightUnit: state.weightUnit));
  }

  FutureOr<void> _updateWeightUnitEvent(
      UpdateWeightUnitEvent event, Emitter<BmiCalculatorState> emit) {
    emit(ValueUpdated(
        weight: state.weight,
        height: state.height,
        age: state.age,
        heightUnit: state.heightUnit,
        weightUnit: event.unit!));
  }
}
