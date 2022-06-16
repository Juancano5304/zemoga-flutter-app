import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.email,
    required this.id,
    required this.name,
    required this.phone,
    required this.username,
    required this.website,
  });

  final int id;
  final String email;
  final String name;
  final String phone;
  final String username;
  final String website;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json[_AttributeKeys.email],
        id: json[_AttributeKeys.id],
        name: json[_AttributeKeys.name],
        phone: json[_AttributeKeys.phone],
        username: json[_AttributeKeys.username],
        website: json[_AttributeKeys.website],
      );

  Map<String, dynamic> toJson() => {
        _AttributeKeys.email: email,
        _AttributeKeys.id: id,
        _AttributeKeys.name: name,
        _AttributeKeys.phone: phone,
        _AttributeKeys.username: username,
        _AttributeKeys.website: website,
      };

  @override
  List<Object?> get props => [
        email,
        id,
        name,
        phone,
        username,
        website,
      ];
}

abstract class _AttributeKeys {
  static const email = 'email';
  static const id = 'id';
  static const name = 'name';
  static const phone = 'phone';
  static const username = 'username';
  static const website = 'website';
}
