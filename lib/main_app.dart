import 'package:bmi_calculator/core/themes/app_theme.dart';
import 'package:bmi_calculator/features/bmi_calculator/data/repositories/bmi_repository_impl.dart';
import 'package:bmi_calculator/features/bmi_calculator/domain/usecases/calculate_bmi.dart';
import 'package:bmi_calculator/features/bmi_calculator/presentation/bloc/bmi_calculator_bloc.dart';
import 'package:bmi_calculator/features/splash/presentation/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                BmiCalculatorBloc(CalculateBmi(BmiRepositoryImpl()))),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          darkTheme: AppTheme.defaultTheme,
          home: const Splash()),
    );
  }
}
