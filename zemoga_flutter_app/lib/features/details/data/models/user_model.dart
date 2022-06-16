// ignore_for_file: annotate_overrides, overridden_fields

import 'package:zemoga_flutter_app/features/details/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required this.email,
    required this.id,
    required this.name,
    required this.phone,
    required this.username,
    required this.website,
  }) : super(
          email: email,
          id: id,
          name: name,
          phone: phone,
          username: username,
          website: website,
        );

  final int id;
  final String email;
  final String name;
  final String phone;
  final String username;
  final String website;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json[_AttributeKeys.email],
        id: json[_AttributeKeys.id],
        name: json[_AttributeKeys.name],
        phone: json[_AttributeKeys.phone],
        username: json[_AttributeKeys.username],
        website: json[_AttributeKeys.website],
      );

  @override
  Map<String, dynamic> toJson() => {
        _AttributeKeys.email: email,
        _AttributeKeys.id: id,
        _AttributeKeys.name: name,
        _AttributeKeys.phone: phone,
        _AttributeKeys.username: username,
        _AttributeKeys.website: website,
      };

  static List<UserModel>? fromList(dynamic list) {
    var result = <UserModel>[];
    if (list != null) {
      result = [];
      for (dynamic user in list) {
        final userModel = UserModel.fromJson(user);
        result.add(userModel);
      }
    }
    return result;
  }
}

abstract class _AttributeKeys {
  static const email = 'email';
  static const id = 'id';
  static const name = 'name';
  static const phone = 'phone';
  static const username = 'username';
  static const website = 'website';
}
