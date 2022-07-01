// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter_demo/modals/CartModal.dart';
import 'package:flutter_demo/modals/cataloge.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatalogueModal catalogueModal;
  late CartModal cartModal;

  MyStore() {
    catalogueModal = CatalogueModal();
    cartModal = CartModal();
    cartModal.catalog = catalogueModal;
  }
}
