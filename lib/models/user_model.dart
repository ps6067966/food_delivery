import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomUser {
  String displayName, email, photoUrl, uid;

  @JsonKey(fromJson: _dateTimeFromTimestamp, toJson: _dateTimeAsIs)
  Timestamp createdTime;

  CustomUser(
      {this.createdTime,
      this.displayName,
      this.email,
      this.photoUrl,
      this.uid});

  factory CustomUser.fromJson(Map<String, dynamic> data) =>
      _$CustomUserFromJson(data);

  Map<String, dynamic> toJson() => _$CustomUserToJson(this);

  static Timestamp _dateTimeAsIs(Timestamp dateTime) => dateTime;

  static Timestamp _dateTimeFromTimestamp(Timestamp timestamp) {
    return timestamp;
  }
}
