import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';

class CatalogueImage extends StatelessWidget {
  final String image;

  const CatalogueImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    )
        .box
        .rounded
        .p4
        .color(context.canvasColor)
        .make()
        // .p16();
        .w16(context)
        .p(context.isMobile ? 10 : 15)
        .wPCT(context: context, widthPCT: context.isMobile ? 30 : 20);
  }
}
