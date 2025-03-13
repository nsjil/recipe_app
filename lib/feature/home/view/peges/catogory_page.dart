import 'package:flutter/material.dart';
import 'package:recipie/feature/home/model/category_gruild_model.dart';
import 'package:recipie/feature/home/model/category_list_model.dart';
import 'package:recipie/feature/home/view/peges/search_result_page.dart';

class Categorypage extends StatelessWidget {
  const Categorypage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.red[400],
          title: Text(
            "For You",
            style: TextStyle(
                fontSize: height * 0.03,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.15,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchResultPage(recipeName: categories[index].name),
                                ),
                              );
                            },
                            child: Container(
                              height: height * 0.08,
                              width: width * 0.2,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(categories[index].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            categories[index].name,
                            style: TextStyle(fontSize: height * 0.02),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "For You",
                      style: TextStyle(
                          fontSize: height * 0.03, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: height * 0.40,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: categoryGridModel.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchResultPage(recipeName: categoryGridModel[index].title,),
                                ),
                              );},
                        child: Container(
                          height: height * 0.2,
                          width: width * 0.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Image.network(
                                categoryGridModel[index].imageUrl,
                                height: height * .06,
                              ),
                              Text(categoryGridModel[index].title,
                                  style: TextStyle(fontSize: height * 0.02)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Your Prefference",
                        style: TextStyle(
                            fontSize: height * 0.03,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.15,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchResultPage(recipeName:categoryPrefference[index].title ,),
                                ),
                              );},
                            child: Container(
                              height: height * 0.08,
                              width: width * 0.2,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      categoryPrefference[index].imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            categoryPrefference[index].title,
                            style: TextStyle(fontSize: height * 0.02),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
