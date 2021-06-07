class ItemModel {
  String title;
  int price;
  bool isVeg;

  ItemModel({
    this.title,
    this.price,
    this.isVeg,
  });

  ItemModel.fromJson(Map<String, dynamic> json) {
    title = json['dishName'];
    isVeg = json['isVeg'];
    price = json['dishPrice'];
  }
}
