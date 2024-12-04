import 'package:bmi_calculator/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    required this.title,
    this.isAge = false,
    required this.value,
    this.onChanged,
    required this.sliderValue,
    this.min = 0,
    this.max = 100,
    this.dropdown,
  });

  final String title;
  final bool isAge;
  final String value;
  final double sliderValue;
  final Function(double)? onChanged;
  final double min;
  final double max;
  final Widget? dropdown;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 150,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: AppColor.accentColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          value,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  (!isAge)
                      ? Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Center(child: dropdown),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
              Expanded(
                child: Slider(
                  activeColor: AppColor.buttonColor,
                  inactiveColor: AppColor.textColor,
                  value: sliderValue,
                  min: min,
                  max: max,
                  divisions: (max - min).toInt(),
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
