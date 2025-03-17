import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:recipie/feature/home/model/item_models.dart';
import 'package:share_plus/share_plus.dart';

class DetailPage extends StatelessWidget {
  final Recipe item;
  const DetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final dataBox = Hive.box('favorite');
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
                ValueListenableBuilder(
                    valueListenable: dataBox.listenable(),
                    builder: (context, Box box, widget) {
                      bool saved = box.containsKey(item.uri);

                      if (saved) {
                        return IconButton(
                            onPressed: () {
                              box.delete(item.uri);
                            },
                            icon: Icon(Icons.favorite));
                      } else {
                        return IconButton(
                            onPressed: () {
                              box.put(item.uri, item.uri);
                            },
                            icon: Icon(Icons.favorite_border));
                      }
                    })
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Calories : ${item.calories!.toInt()}",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: item.calories! > 999 ? Colors.red : Colors.green),
                ),
                Container(
                  height: hright * 0.04,
                  width: width * 0.18,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () async {
                    await Share.share(
                        'Check out this recipe: ${item.label} - ${item.source}');
                  },
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
                  onTap: () {
                    // Implement your download functionality here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Download started...'),
                      ),
                    );
                  },
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
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.red[400],
                          title: Text('Total Nutrients'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children:
                                  item.totalNutrients!.entries.map((entry) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      entry.value.label!,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Quantity: ${entry.value.quantity!.toStringAsFixed(2)} ${entry.value.unit}',
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
                        image:
                            NetworkImage(item.ingredients![index].image ?? ''),
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
