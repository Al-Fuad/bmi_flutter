import 'package:bmi_calculator/core/common/widgets/custom_dialog.dart';
import 'package:bmi_calculator/core/common/widgets/custom_input_field.dart';
import 'package:bmi_calculator/core/constants/app_color.dart';
import 'package:bmi_calculator/features/bmi_calculator/presentation/bloc/bmi_calculator_bloc.dart';
import 'package:bmi_calculator/features/result/presentation/pages/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style:
              TextStyle(color: AppColor.textColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const CustomDialog();
                    });
              },
              icon: const CircleAvatar(
                backgroundColor: AppColor.buttonColor,
                child: Icon(
                  Icons.question_mark,
                  color: AppColor.textColor,
                ),
              ))
        ],
      ),
      body: BlocListener<BmiCalculatorBloc, BmiCalculatorState>(
        listener: (context, state) {
          if (state is BmiCalculated) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Result(state: state.toJson())));
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                BlocBuilder<BmiCalculatorBloc, BmiCalculatorState>(
                  buildWhen: (previous, current) => previous.age != current.age,
                  builder: (context, state) => CustomInputField(
                    title: "Age",
                    isAge: true,
                    value: state.age.toString(),
                    sliderValue: state.age.toDouble(),
                    min: 5,
                    max: 80,
                    onChanged: (value) {
                      context
                          .read<BmiCalculatorBloc>()
                          .add(UpdateAgeEvent(value.toInt()));
                    },
                  ),
                ),
                BlocBuilder<BmiCalculatorBloc, BmiCalculatorState>(
                  buildWhen: (previous, current) =>
                      previous.height != current.height ||
                      previous.heightUnit != current.heightUnit,
                  builder: (context, state) => CustomInputField(
                    title: "Height",
                    value: (state.heightUnit == "f/in") ? "${(state.height/12).floor()}' ${(state.height%12).floor()}\"" : state.height.toStringAsFixed(0),
                    sliderValue: state.height.toDouble(),
                    min: 24,
                    max: 96,
                    dropdown: DropdownButton<String>(
                      value: state.heightUnit,
                      items: ["f/in", "cm"].map((String unit) {
                        return DropdownMenuItem<String>(
                          value: unit,
                          child: Text(unit),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null && newValue != state.heightUnit) {
                          context
                              .read<BmiCalculatorBloc>()
                              .add(UpdateHeightUnitEvent(unit: newValue));
                        }
                      },
                    ),
                    onChanged: (value) {
                      context
                          .read<BmiCalculatorBloc>()
                          .add(UpdateHeightEvent(value.toDouble()));
                    },
                  ),
                ),
                BlocBuilder<BmiCalculatorBloc, BmiCalculatorState>(
                  buildWhen: (previous, current) =>
                      previous.weight != current.weight ||
                      previous.weightUnit != current.weightUnit,
                  builder: (context, state) => CustomInputField(
                    title: "Weight",
                    value: (state.weightUnit == "kg") ? state.weight.toStringAsFixed(2) : (state.weight*2.2).toStringAsFixed(2),
                    sliderValue: state.weight.toDouble(),
                    min: 0.91,
                    max: 200,
                    dropdown: DropdownButton<String>(
                      value: state.weightUnit,
                      items: ["kg", "lbs"].map((String unit) {
                        return DropdownMenuItem<String>(
                          value: unit,
                          child: Text(unit),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null && newValue != state.weightUnit) {
                          context
                              .read<BmiCalculatorBloc>()
                              .add(UpdateWeightUnitEvent(unit: newValue));
                        }
                      },
                    ),
                    onChanged: (value) {
                      context
                          .read<BmiCalculatorBloc>()
                          .add(UpdateWeightEvent(value.toDouble()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 80,
        child: ElevatedButton(
          onPressed: () {
            context.read<BmiCalculatorBloc>().add(CalculateBmiEvent());
          },
          child: const Text(
            'Calculate',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.textColor),
          ),
        ),
      ),
    );
  }
}
