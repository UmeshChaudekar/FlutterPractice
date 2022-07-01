import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/modals/CartModal.dart';
import 'package:flutter_demo/modals/cataloge.dart';
import 'package:flutter_demo/utils/routes.dart';
import 'package:flutter_demo/widget/drawer.dart';
import 'package:flutter_demo/widget/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';
import '../core/store.dart';
import '../widget/homepage/CatalogueList.dart';
// import '../widget/item_widget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Umesh";

  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogueJson =
        await rootBundle.loadString("assets/file/catalogue.json");

    // final response = await http
    //     .get(Uri.parse("https://jsonplaceholder.typicode.com/todos/1"));
    // print("umseh " + response.body.toString());

    // final catalogueJson = response.body;
    // print(catalogueJson);

    final decodeData = jsonDecode(catalogueJson);

    var productsData = decodeData["products"];

    CatalogueModal.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
    // print(productsData);
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20, (index) => CatalogueModal.items[0]);
    final _cart = (VxState.store as MyStore).cartModal;
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.white,
          // iconTheme: IconThemeData(color: Colors.black),
          // elevation: 0.0,
          title: Text("Flutter Demo"),
        ),
        backgroundColor: MyTheme.appBackground, //context.canvasColor
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (ctx, _, _HomePageState) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor: MyTheme.darkishBlueColor,
            child: const Icon(CupertinoIcons.cart),
          ).badge(
              color: Vx.red500,
              size: 22,
              count: _cart.items.length,
              textStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: (CatalogueModal.items != null &&
                  CatalogueModal.items.isNotEmpty)
              // ? ListView.builder(
              //     itemCount: CatalogueModal.items.length,
              //     // itemCount: dummyList.length,
              //     itemBuilder: (context, index) => InkWell(
              //         onTap: () => Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => ProductDetailsPage(
              //                     catalogue: CatalogueModal.items[index]))),
              //         child: ItemWidget(item: CatalogueModal.items[index]))
              //     // return ItemWidget(item: dummyList[index]);
              //     )
              ? CatalogueList().expand()
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
        drawer: MyDrawer());
  }
}
