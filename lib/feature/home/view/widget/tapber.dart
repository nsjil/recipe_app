import 'package:flutter/material.dart';
import 'package:recipie/feature/home/view/widget/categoryWidget.dart';

class Tabbarwidget extends StatelessWidget {
  const Tabbarwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              color: Colors.transparent,
              child: TabBar(
                indicator: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                unselectedLabelColor: Colors.black,
                labelColor: Colors.white,
                dividerColor: Colors.transparent,
                tabs: [
                  const TabbarItem(title: "BreakFast"),
                  const TabbarItem(title: "Lunch"),
                  const TabbarItem(title: "Dinner"),
                  const TabbarItem(
                    title: "Quick",
                  )
                ],
                isScrollable: false,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.380,
              child: const TabBarView(children: [
                Categorywidget(recipe: "BreakFast"),
                Categorywidget(recipe: "Lunch"),
                Categorywidget(recipe: "Dinner"),
                Categorywidget(recipe: "Quick"),
              ]),
            ),
          ],
        ));
  }
}

class TabbarItem extends StatelessWidget {
  final String title;
  const TabbarItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(15),
      ),
      height: MediaQuery.of(context).size.height * 0.05,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 8),
        ),
      ),
    );
  }
}



