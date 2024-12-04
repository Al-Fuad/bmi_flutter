import 'package:bmi_calculator/core/constants/app_color.dart';
import 'package:bmi_calculator/features/bmi_calculator/presentation/pages/bmi_calculator.dart';
import 'package:bmi_calculator/features/result/presentation/widgets/bmi_gauge.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key, required this.state});

  final Map<String, dynamic> state;

  @override
  Widget build(BuildContext context) {
    final bmi = '${state['bmiValue']}';
    final category = '${state['category']}';
    return Scaffold(
      appBar: AppBar(
          title: const Text('Result',
              style: TextStyle(
                  color: AppColor.textColor, fontWeight: FontWeight.bold))),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.all(20),
                height: 500,
                width: 300,
                decoration: const BoxDecoration(
                  color: AppColor.accentColor,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        BmiGauge(
                          bmi: double.parse(bmi),
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        const SizedBox(height: 100),
                          Text(bmi,
                              style: const TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 20),
                          Text(category,
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 80,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const BmiCalculator()));
          },
          child: const Text(
            'Re-Calculate',
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
