import 'package:classassignment2/cubit/area_circle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaCircleView extends StatelessWidget {
  const AreaCircleView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController radiusController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Pawan Area of Circle")),
      body: BlocProvider(
        create: (_) => AreaCircleCubit(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: radiusController,
                decoration: const InputDecoration(labelText: "Radius"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final cubit = context.read<AreaCircleCubit>();
                  final radiusText = radiusController.text;

                  if (radiusText.isNotEmpty) {
                    try {
                      final radius = double.parse(radiusText);
                      cubit.calculate(radius);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Please enter a valid number")),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Radius cannot be empty")),
                    );
                  }
                },
                child: const Text("Calculate"),
              ),
              const SizedBox(height: 20),
              BlocBuilder<AreaCircleCubit, double>(
                builder: (context, area) {
                  return Text(
                    "Area of Circle: $area",
                    style: const TextStyle(fontSize: 18),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
