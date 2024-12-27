import 'package:classassignment2/view/area_circle_view.dart';
import 'package:classassignment2/view/simple_interest_view.dart';
import 'package:flutter/material.dart';

class DashboardCubitView extends StatelessWidget {
  const DashboardCubitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pawan Dashboard'),
        centerTitle: true,
      ),
      body: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        children: <Widget>[
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AreaCircleView(),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(Icons.add, size: 48),
                  Text('Area of Circle Cubit'),
                ],
              ),
            ),
          ),
          Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SimpleInterestView(),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(Icons.calculate, size: 48),
                  Text('Simple Interest Cubit'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
