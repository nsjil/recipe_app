import 'package:flutter/material.dart';
import 'package:recipie/feature/home/view/widget/tapber.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'What are you\ncooking today?',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  hintText: " what's cooking in your mind?",
                  trailing: const [
                    Icon(
                      Icons.search,
                      color: Colors.amber,
                    ),
                  ]),
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://i.pinimg.com/736x/69/62/d4/6962d4c774688b5472e837e57bb6b77d.jpg"),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Categories",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  InkWell(onTap: () {}, child: const Text("see all"))
                ],
              ),
              const Tabbarwidget(),
            ],
          ),
        ));
  }
}

