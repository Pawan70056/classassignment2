import 'package:classassignment2/cubit/simple_interest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleInterestView extends StatelessWidget {
  const SimpleInterestView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController principalController = TextEditingController();
    final TextEditingController rateController = TextEditingController();
    final TextEditingController timeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Pawan Simple Interest")),
      body: BlocProvider(
        create: (_) => SimpleInterestCubit(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: principalController,
                decoration: const InputDecoration(labelText: "Principal"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: rateController,
                decoration:
                    const InputDecoration(labelText: "Rate of Interest"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: timeController,
                decoration: const InputDecoration(labelText: "Time"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final cubit = context.read<SimpleInterestCubit>();
                  final principalText = principalController.text;
                  final rateText = rateController.text;
                  final timeText = timeController.text;

                  if (principalText.isNotEmpty &&
                      rateText.isNotEmpty &&
                      timeText.isNotEmpty) {
                    try {
                      final principal = double.parse(principalText);
                      final rate = double.parse(rateText);
                      final time = double.parse(timeText);
                      cubit.calculate(principal, rate, time);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please enter valid numeric values"),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("All fields are required"),
                      ),
                    );
                  }
                },
                child: const Text("Calculate"),
              ),
              const SizedBox(height: 20),
              BlocBuilder<SimpleInterestCubit, double>(
                builder: (context, interest) {
                  return Text(
                    "Simple Interest: $interest",
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
