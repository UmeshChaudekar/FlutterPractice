import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/core/store.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:velocity_x/velocity_x.dart';
import '../../modals/CartModal.dart';
import '../../modals/cataloge.dart';
import '../theme.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModal _cart = (VxState.store as MyStore).cartModal;
    // bool isInCart = _cart.items.contains(catalog) ?? false;
    bool isInCart = false;
    if (_cart.items.contains(catalog)) {
      isInCart = true;
    } else {
      isInCart = false;
    }

    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            AddMutation(item: catalog);
          }
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(MyTheme.darkishBlueColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child:
            isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
