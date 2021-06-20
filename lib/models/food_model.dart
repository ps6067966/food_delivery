import 'package:json_annotation/json_annotation.dart';

part 'food_model.g.dart';

@JsonSerializable()
class FoodModel {
  String foodId;
  String foodName;
  String foodUrl;
  String foodCategory;
  String foodIngredients;
  num foodDeliveryTime;
  num foodPrice;
  bool isVeg;

  FoodModel(
      {this.foodUrl,
      this.foodName,
      this.foodIngredients,
      this.foodDeliveryTime,
      this.foodCategory,
      this.foodId,
      this.foodPrice,
      this.isVeg});

  factory FoodModel.fromJson(Map<String, dynamic> data) =>
      _$FoodModelFromJson(data);

  Map<String, dynamic> toJson() => _$FoodModelToJson(this);
}
