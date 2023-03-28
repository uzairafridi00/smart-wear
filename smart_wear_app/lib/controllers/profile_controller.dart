import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:smart_wear/controllers/session_controller.dart';

import 'package:smart_wear/core/app_export.dart';
import 'package:smart_wear/core/utils/utils.dart';

class ProfileController with ChangeNotifier {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  final nameFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();

  DatabaseReference ref = FirebaseDatabase.instance.ref().child('Users');
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final picker = ImagePicker();
  File? _image;
  File? get image => _image;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future pickGalleryImage(BuildContext context) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      uploadImage(context);
      notifyListeners();
    }
  }

  Future pickCameraImage(BuildContext context) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 100);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      uploadImage(context);
      notifyListeners();
    }
  }

  void pickImage(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 120,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    pickCameraImage(context);
                    Navigator.pop(context);
                  },
                  leading: Icon(
                    CupertinoIcons.camera,
                    color: ColorConstant.amber700,
                  ),
                  title: Text('Camera'),
                ),
                ListTile(
                  onTap: () {
                    pickGalleryImage(context);
                    Navigator.pop(context);
                  },
                  leading: Icon(
                    CupertinoIcons.doc_fill,
                    color: ColorConstant.amber700,
                  ),
                  title: Text('Gallery'),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void uploadImage(BuildContext context) async {
    setLoading(true);
    firebase_storage.Reference storageRef = firebase_storage
        .FirebaseStorage.instance
        .ref('/profileImage' + SessionController().userId.toString());
    firebase_storage.UploadTask uploadTask =
        storageRef.putFile(File(image!.path).absolute);
    await Future.value(uploadTask);

    final newUrl = await storageRef.getDownloadURL();

    ref.child(SessionController().userId.toString()).update({
      'profile': newUrl.toString(),
    }).then((value) {
      Utils().toastMessage("Profile updated successfully.");
      setLoading(false);
      _image = null;
    }).onError((error, stackTrace) {
      String errorMessage = "Something went Wrong. Try Again";
      Utils().toastMessage(errorMessage);
      setLoading(false);
    });
  }

  Future<void> showUserNameDialogAlert(BuildContext context, String name) {
    nameController.text = name;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(child: Text('Update username')),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    focusNode: nameFocusNode,
                    keyboardType: TextInputType.text,
                    decoration:
                        const InputDecoration(labelText: 'Enter username'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Username can't be empty";
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
              TextButton(
                onPressed: () {
                  ref.child(SessionController().userId.toString()).update({
                    'userName': nameController.text.toString(),
                  }).then((value) {
                    nameController.clear();
                    Utils().toastMessage("Username updated successfully");
                  }).onError((error, stackTrace) {
                    String errorMessage = "An Error Occured. Try again later";
                    Utils().toastMessage(errorMessage);
                  });
                  Navigator.pop(context);
                },
                child: Text(
                  'Ok',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ],
          );
        });
  }

  Future<void> showPhoneDialogAlert(BuildContext context, String phoneNumber) {
    phoneController.text = phoneNumber;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(child: Text('Update Phone Number')),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: phoneController,
                    focusNode: phoneFocusNode,
                    keyboardType: TextInputType.phone,
                    decoration:
                        const InputDecoration(labelText: 'Enter Phone Number'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Phone Number can't be empty";
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
              TextButton(
                onPressed: () {
                  ref.child(SessionController().userId.toString()).update({
                    'phone': phoneController.text.toString(),
                  }).then((value) {
                    phoneController.clear();
                    Utils().toastMessage("Username updated successfully");
                  }).onError((error, stackTrace) {
                    String errorMessage = "An Error Occured. Try again later";
                    Utils().toastMessage(errorMessage);
                  });
                  Navigator.pop(context);
                },
                child: Text(
                  'Ok',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ],
          );
        });
  }
}
