import 'package:flutter/material.dart';

class AppUser {
  final String name;
  final String email;
  final String username;
  final String pictureUrl;

  AppUser({
    required this.name,
    required this.email,
    required this.username,
    required this.pictureUrl,
  });

  factory AppUser.fromMap(Map<String, dynamic> data) {
    return AppUser(
      name: data['name'],
      email: data['email'],
      username: data['username'],
      pictureUrl: data['pictureUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'username': username,
      'pictureUrl': pictureUrl,
    };
  }
}
