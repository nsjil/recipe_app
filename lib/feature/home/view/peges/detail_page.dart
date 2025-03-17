import 'package:flutter/material.dart';
import 'package:recipie/feature/home/model/item_models.dart';

class DetailPage extends StatelessWidget {
  final Recipe item;
  const DetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final hright = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text(
          item.label!,
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 1.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(item.image!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    item.label!,
                    style: TextStyle(
                        fontSize: width * .05, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  height: hright * 0.04,
                  width: width * 0.17,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen[300],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: Center(
                    child: Text(
                      "${item.totalTime!}0 min",
                      style: TextStyle(
                          fontSize: width * .03, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  item.source!,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Text(
                  "Calories : ${item.calories!.toInt()}",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: item.calories! > 600 ? Colors.red : Colors.green),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 20,
                    child: Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 20,
                    child: Icon(
                      Icons.save_alt_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.red[400],
                          title: Text('Digest Information'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: item.digest!.map((digestItem) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      digestItem.label!,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Total: ${digestItem.total!.toStringAsFixed(2)} ${digestItem.unit}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      'Daily: ${digestItem.daily!.toStringAsFixed(2)}%',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: Text('Close'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 20,
                    child: Icon(Icons.bar_chart_rounded, color: Colors.white),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 20,
                    child: Icon(Icons.content_paste_search_outlined,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("recipe details".toUpperCase(),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "incredients :",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: item.ingredients!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    height: hright * 0.05,
                    width: width * 0.17,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(item.ingredients![index].image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Text(
                    item.ingredients![index].text!,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
