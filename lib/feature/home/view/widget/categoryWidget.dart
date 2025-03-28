import 'package:flutter/material.dart';
import 'package:recipie/feature/home/service/api_service.dart';
import 'package:recipie/feature/home/view/pages/cart_detail_page.dart';

class Categorywidget extends StatefulWidget {
  final String recipe;
  const Categorywidget({super.key, required this.recipe});

  @override
  State<Categorywidget> createState() => _CategorywidgetState();
}

class _CategorywidgetState extends State<Categorywidget> {
  int items = 10;
  List recipes = [];
  bool isLoading = false;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
    fetchData();
  }

  void _onScroll() {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 100 &&
        !isLoading) {
      fetchData();
    }
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      final newRecipes =
          await RecipeApiService.getRecipes(widget.recipe, items);
      setState(() {
        recipes = newRecipes;
        items += 10;
      });
    } catch (e) {
      print("Error fetching data: $e");
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size;

    return Stack(
      children: [
        GridView.builder(
          controller: scrollController,
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
                    height: height.height * 0.13,
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
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        recipes[index].source!,
                        style: const TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Text(
                        ' ${recipes[index].calories!.toStringAsFixed(2)} + CAL ',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
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
        ),
        if (isLoading)
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: const Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }
}
