import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/modals/cataloge.dart';
import 'package:flutter_demo/widget/drawer.dart';
import 'package:flutter_demo/widget/theme.dart';

class GridPage extends StatefulWidget {
  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogueJson =
        await rootBundle.loadString("assets/file/catalogue.json");
    final decodeData = jsonDecode(catalogueJson);
    var productsData = decodeData["products"];
    CatalogueModal.items = List.from(productsData)
        .map<Item>((items) => Item.fromMap(items))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogueModal.items != null && CatalogueModal.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  final item = CatalogueModal.items[index];
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                        // header: Container(
                        //   child: Text(
                        //     item.name,
                        //     style: TextStyle(color: Colors.white),
                        //   ),
                        //   padding: const EdgeInsets.all(12),
                        //   decoration: BoxDecoration(color: Colors.deepPurple),
                        // ),
                        // child: Image.network(item.image),
                        // footer: Container(
                        //   child: Text(
                        //     item.price.toString(),
                        //     style: TextStyle(color: Colors.white),
                        //   ),
                        //   decoration: BoxDecoration(color: Colors.amber),
                        // ),

                        child: Container(
                          alignment: Alignment.center,
                          decoration:
                              BoxDecoration(color: MyTheme.appBackground),
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.network(
                                    item.image,
                                    width: 100,
                                    height: 100,
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item.name,
                                    maxLines: 2,
                                    softWrap: true,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "\$${item.price.toString()}",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Buy",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ));
                },
                itemCount: CatalogueModal.items.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
