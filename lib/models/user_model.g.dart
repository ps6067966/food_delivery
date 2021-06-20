// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomUser _$CustomUserFromJson(Map<String, dynamic> json) {
  return CustomUser(
    createdTime:
        CustomUser._dateTimeFromTimestamp(json['createdTime'] as Timestamp),
    displayName: json['displayName'] as String,
    email: json['email'] as String,
    photoUrl: json['photoUrl'] as String,
    uid: json['uid'] as String,
  );
}

Map<String, dynamic> _$CustomUserToJson(CustomUser instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'uid': instance.uid,
      'createdTime': CustomUser._dateTimeAsIs(instance.createdTime),
    };
