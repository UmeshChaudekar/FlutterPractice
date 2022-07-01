import 'package:flutter/material.dart';
import 'package:flutter_demo/modals/cataloge.dart';
import 'package:flutter_demo/widget/homepage/AddToCart.dart';
import 'package:flutter_demo/widget/theme.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

class ProductDetailsPage extends StatelessWidget {
  final Item catalogue;

  const ProductDetailsPage({super.key, required this.catalogue})
      : assert(catalogue != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(catalogue.name),
      ),
      backgroundColor: MyTheme.appBackground,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalogue.price}".text.bold.xl2.red800.make(),
            AddToCart(catalog: catalogue).wh(120, 35)
          ],
        ).p16(),
      ),
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                      tag: Key(catalogue.id.toString()),
                      child: Image.network(catalogue.image).p16())
                  .h32(context),
              Expanded(
                child: VxArc(
                  height: 25.0,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    color: Colors.white,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalogue.name.text.xl3
                            .color(MyTheme.darkishBlueColor)
                            .bold
                            .make(),
                        catalogue.desc.text.xl
                            .textStyle(context.captionStyle)
                            .make(),
                        10.heightBox,
                        "Consetetur sed est stet justo sit, aliquyam ut lorem dolores magna duo dolore justo erat erat, elitr magna eirmod dolores invidunt. Magna sadipscing magna dolor lorem invidunt, labore sanctus sed ipsum nonumy sit, rebum lorem ipsum lorem takimata, sit nonumy voluptua rebum lorem, sed sed ut et et ea sed sea rebum, ipsum dolore erat et accusam, amet sadipscing diam diam lorem amet gubergren et, et diam sea magna vero."
                            .text
                            .textStyle(context.captionStyle)
                            .make()
                            .p16()
                      ],
                    ).py32(),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
