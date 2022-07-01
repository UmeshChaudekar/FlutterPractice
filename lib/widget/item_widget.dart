import 'package:flutter/material.dart';
// import 'package:flutter_demo/utils/routes.dart';
import 'package:flutter_demo/widget/theme.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';
import '../modals/cataloge.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item}) : assert(item != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 0.0,
      shadowColor: Colors.deepPurple,

      child: Container(
        child: Column(
          children: [
            ListTile(
              // onTap: () {
              //   print(item.name);
              // },

              leading: Hero(
                  tag: Key(item.id.toString()),
                  child: Image.network(item.image)),
              title: Text(item.name),
              subtitle: Text(item.desc),
              // trailing: Text(
              //   "\$${item.price.toString()}",
              //   textScaleFactor: 1.3,
              //   style: TextStyle(
              //       color: Colors.deepPurple, fontWeight: FontWeight.bold),
              // ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${item.price}".text.bold.xl2.red800.make(),
                ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                MyTheme.darkishBlueColor),
                            shape: MaterialStateProperty.all(StadiumBorder())),
                        child: "Buy".text.make())
                    .wh(80, 35)
              ],
            ).p16(),
          ],
        ),
      ),
    );
  }
}
