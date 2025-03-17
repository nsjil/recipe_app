import 'package:flutter/material.dart';
import 'package:recipie/feature/home/model/category_list_model.dart';
import 'package:recipie/feature/home/view/peges/search_result_page.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final searchController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[400],
          title: Center(
              child: Text("Search",
                  style: TextStyle(
                    color: Colors.white,
                    height: height * 0.03,
                    fontWeight: FontWeight.bold,
                  ))),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(
                controller: searchController,
                trailing: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchResultPage(
                                    recipeName: searchController.text,
                                  )));
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.amber,
                    ),
                  ),
                ],
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                hintText: "What's cooking in your mind...?",
                onChanged: (value) {
                  print(value);
                },
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Search Tags",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              SizedBox(
                  height: height * 0.50,
                  child: Wrap(
                    spacing: 10,
                    alignment: WrapAlignment.start,
                    runSpacing: 20,
                    children: tag.map(
                      (e) {
                        return ElevatedButton(onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchResultPage(
                                        recipeName: e,
                                      )));
                        }, child: Text(e));
                      },
                    ).toList(),
                  )),
            ],
          ),
        ));
  }
}
