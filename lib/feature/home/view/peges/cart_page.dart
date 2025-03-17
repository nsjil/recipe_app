import 'package:flutter/material.dart';

class FavoratPage extends StatelessWidget {
  const FavoratPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text("Your Cart",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              height: height * 0.03,
              color: Colors.white,
            )),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: 20, // Replace with the actual number of items
              itemBuilder: (context, index) {
                return Card(
                  child: Center(
                    child: Text('Item $index'),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
