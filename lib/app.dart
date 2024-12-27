import 'package:classassignment2/cubit/area_circle_cubit.dart';
import 'package:classassignment2/cubit/dashboard_cubit.dart';
import 'package:classassignment2/cubit/simple_interest_cubit.dart';
import 'package:classassignment2/view/dashboard_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AreaCircleCubit()),
        BlocProvider(create: (_) => SimpleInterestCubit()),
        BlocProvider(
          create: (context) => DashboardCubit(
            context.read<SimpleInterestCubit>(),
            context.read<AreaCircleCubit>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter BLoC',
        home: const DashboardCubitView(),
      ),
    );
  }
}
