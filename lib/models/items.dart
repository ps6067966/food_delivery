class ItemModel {
  String address;
  String dateDay;

  ItemModel({
    this.address,
    this.dateDay,
  });
  ItemModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    dateDay = json['DateDay'];
  }
}
