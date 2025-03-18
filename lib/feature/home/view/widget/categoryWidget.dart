// ignore: file_names
import 'package:flutter/material.dart';
import 'package:recipie/feature/home/service/api_service.dart';
import 'package:recipie/feature/home/view/peges/detail_page.dart';

class Categorywidget extends StatelessWidget {
  final String recipe;
  const Categorywidget({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size;

    return FutureBuilder(
        future: RecipeApiService.getRecipes(recipe),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapShot.hasError) {
            return const Center(child: Text('Error'));
          }
          if (!snapShot.hasData || snapShot.data!.isEmpty) {
            return Center(child: Text('No Data Found'));
          }

          final recipes = snapShot.data!;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                item: recipes[index],
                              )));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: hight.height * 0.13,
                      width: width.width * 0.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(recipes[index].image!),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Text(
                      recipes[index].label!,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          recipes[index].source!,
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        Text(
                          ' ${recipes[index].calories!.toStringAsFixed(2)} + CAL ',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
