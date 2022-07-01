// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_demo/core/store.dart';
import 'package:flutter_demo/modals/cataloge.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModal {
  //SingleTone Class start
  // static final cartModal = CartModal._internal();
  // CartModal._internal();
  // factory CartModal() => cartModal;
//SingleTone Class end

  //CatalogueModal
  late CatalogueModal _catalogue;

  //Collection of id's - store ids of each item
  final List<int> _itemIds = [];

  //Get catalogue
  CatalogueModal get catalog => _catalogue;

  set catalog(CatalogueModal newCatalogue) {
    assert(newCatalogue != null);
    _catalogue = newCatalogue;
  }

//Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalogue.getById(id)).toList();

  //Get Total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  late Item item;
  AddMutation({
    required this.item,
  });

  @override
  perform() {
    store?.cartModal._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  late Item item;
  RemoveMutation({
    required this.item,
  });

  @override
  perform() {
    store?.cartModal._itemIds.remove(item.id);
  }
}
