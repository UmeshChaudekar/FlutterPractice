// import 'dart:ffi';

class CatalogueModal {
  //SingleTone Class start
  // static final CatalogueModal catalogueModal = CatalogueModal._internal();
  // CatalogueModal._internal();
  // factory CatalogueModal() => catalogueModal;
//SingleTone Class end

  static List<Item> items = List.empty();

  // static final items = [
  //   Item(
  //       id: 1,
  //       name: "iPhone 12 Pro",
  //       desc: "Apple iPhone 12th generation",
  //       price: 999,
  //       color: "#33505a",
  //       image:
  //           "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-pro-blue-hero?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1604021661000")
  // ];

  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        image: map["image"]);
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image
      };
}