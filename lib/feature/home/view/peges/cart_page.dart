import 'package:flutter/material.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

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
    );
  }
}
