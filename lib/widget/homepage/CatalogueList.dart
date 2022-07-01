// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_demo/page/ProductDetailsPage.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../modals/cataloge.dart';
import '../theme.dart';
import 'AddToCart.dart';
import 'CatalogueImage.dart';

class CatalogueList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10.0),
            shrinkWrap: true,
            itemCount: CatalogueModal.items.length,
            itemBuilder: (context, index) {
              final catalogue = CatalogueModal.items[index];
              return InkWell(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(
                            catalogue: catalogue,
                            // catalogue: CatalogueModal.getById(2),
                          ),
                        ),
                      ),
                  child: CatalogueItem(catalogue: catalogue));
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogueModal.items.length,
            itemBuilder: (context, index) {
              final catalogue = CatalogueModal.items[index];
              // final catalogue = CatalogueModal.getByPosition(index);
              return InkWell(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(
                            catalogue: catalogue,
                            // catalogue: CatalogueModal.getById(2),
                          ),
                        ),
                      ),
                  child: CatalogueItem(catalogue: catalogue));
            },
          );
  }
}

class CatalogueItem extends StatelessWidget {
  final Item catalogue;
  const CatalogueItem({Key? key, required this.catalogue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
        tag: Key(catalogue.id.toString()),
        child: CatalogueImage(
          image: catalogue.image,
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalogue.name.text.lg.color(MyTheme.darkishBlueColor).bold.make(),
            catalogue.desc.text.textStyle(context.captionStyle!).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalogue.price}".text.bold.red800.make(),
                AddToCart(
                  catalog: catalogue,
                )
                // .wh(80, 35)
              ],
            ).p4(),
          ],
        ).p(context.isMobile ? 2 : 16),
      )
    ];
    return VxBox(
      child: context.isMobile
          ? Row(
              children: children2,
            )
          : Column(
              children: children2,
            ),
    ).color(context.cardColor).rounded.square(130).make().p8();
  }
}
