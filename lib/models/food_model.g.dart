// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodModel _$FoodModelFromJson(Map<String, dynamic> json) {
  return FoodModel(
    foodUrl: json['foodUrl'] as String,
    foodName: json['foodName'] as String,
    foodIngredients: json['foodIngredients'] as String,
    foodDeliveryTime: json['foodDeliveryTime'] as num,
    foodCategory: json['foodCategory'] as String,
    foodId: json['foodId'] as String,
    foodPrice: json['foodPrice'] as num,
    isVeg: json['isVeg'] as bool,
  );
}

Map<String, dynamic> _$FoodModelToJson(FoodModel instance) => <String, dynamic>{
      'foodId': instance.foodId,
      'foodName': instance.foodName,
      'foodUrl': instance.foodUrl,
      'foodCategory': instance.foodCategory,
      'foodIngredients': instance.foodIngredients,
      'foodDeliveryTime': instance.foodDeliveryTime,
      'foodPrice': instance.foodPrice,
      'isVeg': instance.isVeg,
    };
