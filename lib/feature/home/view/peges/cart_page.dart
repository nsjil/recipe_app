import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:recipie/feature/home/model/item_models.dart';
import 'package:recipie/feature/home/view/peges/detail_page.dart';

class FavoratPage extends StatelessWidget {
  const FavoratPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dataBox = Hive.box('favorite');

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
          ValueListenableBuilder(
              valueListenable: dataBox.listenable(),
              builder: (context, Box box, _) {
                var data = box.values.toList();
                var modelData = data.map(
                  (e) {
                    return Recipe.fromJson(e);
                  },
                ).toList();
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount:
                        data.length, // Replace with the actual number of items
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return DetailPage(item: modelData[index]);
                                },
                              ));
                            },
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          modelData[index].image!))),
                            ),
                          ),
                          IconButton(
                              onPressed: () async {
                                await box.delete(modelData[index].uri);
                              },
                              icon: Icon(Icons.delete))
                        ],
                      );
                    },
                  ),
                );
              })
        ],
      ),
    );
  }
}
