import 'package:flutter/material.dart';
import 'package:recipie/feature/home/service/api_service.dart';

class SearchResultPage extends StatelessWidget {
  final String recipeName;
  const SearchResultPage({super.key, required this.recipeName});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Search Result',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {},
            ),
          ],
        ),
        body: FutureBuilder(future: RecipeApiService.getRecipes( recipeName),
          builder: (context,snapShot) {
            if(snapShot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }
            if (snapShot.hasError) {
            return const Center(child: Text('Error'));
          }
          if (!snapShot.hasData || snapShot.data!.isEmpty) {
            return Center(child: Text('No Data Found'));
          }
            final recipes = snapShot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 15,mainAxisExtent: 200),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(height: height * 0.2,
                          decoration: BoxDecoration(color: Colors.amber,image: DecorationImage(image: NetworkImage(recipes[index].image!),fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10),
                            
                          ),
                        ),
                         Text(
                          "${recipes[index].label}",
                        ),
                      ],
                    );
                  }),
            );
          }
        ));
  }
}
