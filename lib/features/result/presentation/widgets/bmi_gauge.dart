import 'package:bmi_calculator/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BmiGauge extends StatelessWidget {
  final double bmi;

  const BmiGauge({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          startAngle: 180,
          endAngle: 0,
          minimum: 10,
          maximum: 40,
          ranges: <GaugeRange>[
            GaugeRange(
              startValue: 10,
              endValue: 16,
              color: Colors.red,
              // label: 'Underweight',
              startWidth: 20,
              endWidth: 20,
            ),
            GaugeRange(
              startValue: 16,
              endValue: 18.5,
              color: Colors.orange,
              label: '',
              startWidth: 20,
              endWidth: 20,
            ),
            GaugeRange(
              startValue: 18.5,
              endValue: 25,
              color: Colors.green,
              // label: 'Normal',
              startWidth: 20,
              endWidth: 20,
            ),
            GaugeRange(
              startValue: 25,
              endValue: 30,
              color: Colors.yellow,
              // label: 'Overweight',
              startWidth: 20,
              endWidth: 20,
            ),
            GaugeRange(
              startValue: 30,
              endValue: 35,
              color: Colors.orange,
              label: '',
              startWidth: 20,
              endWidth: 20,
            ),
            GaugeRange(
              startValue: 35,
              endValue: 40,
              color: Colors.red,
              // label: 'Obese',
              startWidth: 20,
              endWidth: 20,
            ),
          ],
          pointers: <GaugePointer>[
            NeedlePointer(
              value: bmi,
              enableAnimation: true,
              needleColor: AppColor.secondaryColor,
              knobStyle: const KnobStyle(color: AppColor.secondaryColor),
            ),
          ],
        ),
      ],
    );
  }
}
