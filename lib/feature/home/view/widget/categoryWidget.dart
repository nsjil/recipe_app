import 'package:flutter/material.dart';
import 'package:recipie/feature/home/service/api_service.dart';

class Categorywidget extends StatelessWidget {
  final String recipe;
  const Categorywidget({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
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
          return SizedBox(
            height: 50,
            child: Flexible(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Image.network(
                          recipes[index].image!,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}




