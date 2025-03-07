import 'package:flutter/material.dart';

class Categorywidget extends StatelessWidget {
  final String recipe;
  const Categorywidget({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Flexible(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(recipe),
              ),
            );
          },
        ),
      ),
    );
  }
}
