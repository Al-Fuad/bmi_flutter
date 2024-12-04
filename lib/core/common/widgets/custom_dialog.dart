import 'package:bmi_calculator/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: AppColor.accentColor,
      elevation: 0,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    width: 80,
                    height: 80,
                    'assets/logo/rounded_logo.png',
                  ),
                  const Text(
                    'BMI Calculator',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Body Mass Index (BMI) is a measure of body fat based on your weight '
                    'in relation to your height. It is commonly used to categorize individuals as '
                    'underweight, normal weight, overweight, or obese.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Instructions:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '1. Use the sliders to select your age, weight and height.\n'
                    '2. Press "Calculate BMI" to view your result.\n'
                    '3. Check the category to understand your BMI status.',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 12),
                  Table(
                    border: TableBorder.all(color: Colors.grey),
                    columnWidths: const {
                      0: FlexColumnWidth(3),
                      1: FlexColumnWidth(2),
                    },
                    children: [
                      const TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Classification',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'BMI Range (kg/m²)',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      ...[
                        ['Severe Thinness', '< 16'],
                        ['Moderate Thinness', '16 - 17'],
                        ['Mild Thinness', '17 - 18.5'],
                        ['Normal', '18.5 - 25'],
                        ['Overweight', '25 - 30'],
                        ['Obese Class I', '30 - 35'],
                        ['Obese Class II', '35 - 40'],
                        ['Obese Class III', '> 40'],
                      ].map(
                        (row) => TableRow(
                          children: row.map((cell) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(cell),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'This is the World Health Organization\'s (WHO) recommended body weight based on BMI values for adults. It applies to both men and women, age 20 or older.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 5,
            top: 5,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close)),
          ),
        ],
      ),
    );
  }
}
