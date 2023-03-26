import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserController {
  final _auth = FirebaseAuth.instance;
  final _storage = FirebaseStorage.instance;
  final _usersRef = FirebaseFirestore.instance.collection('users');

  late AppUser _user;

  Future<AppUser> fetchUser() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      final docSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get();
      final data = docSnapshot.data();
      String? pictureUrl = data?['pictureUrl'];

      if (pictureUrl == null) {
        // Display default image from assets folder
        pictureUrl = 'assets/images/profile_pic.png';
      } else {
        // Get download URL for image from Firebase Storage
        pictureUrl =
            await FirebaseStorage.instance.ref(pictureUrl).getDownloadURL();
      }

      _user = AppUser.fromMap({
        'name': data?['name'],
        'email': data?['email'],
        'username': data?['username'],
        'pictureUrl': pictureUrl,
      });

      return _user;
    } catch (e) {
      // Display error message to the user
      print(e);
      return _user;
    }
  }

  Future<void> updateUser({
    required String name,
    required String email,
    required String password,
    File? imageFile,
  }) async {
    final user = _auth.currentUser!;
    final userRef = _usersRef.doc(user.uid);

    // Update user data
    final userData = {
      'name': name,
      'email': email,
    };
    await userRef.update(userData);

    // Update user password
    if (password.isNotEmpty) {
      await user.updatePassword(password);
    }

    // Update user profile picture
    if (imageFile != null) {
      final fileName = '${user.uid}.jpg';
      final filePath = 'users/$fileName';
      final storageRef = _storage.ref().child(filePath);

      // Upload image to Firebase Storage
      await storageRef.putFile(imageFile);

      // Get download URL for image
      final imageUrl = await storageRef.getDownloadURL();

      // Update user data with new image URL
      userData['pictureUrl'] = imageUrl;

      // Update the user document with the new data
      await userRef.update(userData);
    }
  }

  Future<String?> uploadImage(File imageFile, String fileName) async {
    try {
      final Reference storageRef =
          FirebaseStorage.instance.ref().child('images/$fileName');
      final UploadTask uploadTask = storageRef.putFile(imageFile);
      final TaskSnapshot downloadUrl = (await uploadTask);
      final String url = await downloadUrl.ref.getDownloadURL();
      return url;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
