import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_application/core/theme/app_theme.dart';
import 'package:movie_application/core/utils/snackbar_utils.dart';

final imageUrlProvider = StateProvider<String>((ref) {
  return '';
});

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  static const String routePath = "/profile-path";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          "Profile Page",
          style: TextStyle(color: AppTheme.of(context).colors.secondary),
        ),
        backgroundColor: AppTheme.of(context).colors.primary,
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(
          onTap: () async {
            XFile? pickedImage = await pickImageFromCamera(context);
            if (pickedImage != null) {
              File image = File(pickedImage.path);
              try {
                final url = await FirebaseStorageService()
                    .uploadFile(image, pickedImage.name);
                ref.read(imageUrlProvider.notifier).state = url;
              } on FirebaseException catch (e) {
                Future.sync(
                  () => SnackbarUtils.showMessage(context, "${e.message}"),
                );
              }
              // print(pickedImage.name);
            }
          },
          child: CircleAvatar(
            radius: 100,
            backgroundImage: ref.watch(imageUrlProvider).isEmpty
                ? null
                : NetworkImage(ref.watch(imageUrlProvider)),
          ),
        ),
      ),
    );
  }

  Future<XFile?> pickImageFromCamera(BuildContext context) async {
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      return pickedImage;
    } else {
      Future.sync(
        () => SnackbarUtils.showMessage(context, "No Image picked"),
      );
      return null;
    }
  }
}

class FirebaseStorageService {
  final profileRef = FirebaseStorage.instance.ref("profile");

  Future<String> uploadFile(File image, String fileName) async {
    await profileRef.child(fileName).putFile(image);
    final downloadUrl = await profileRef.child(fileName).getDownloadURL();
    return downloadUrl;
  }
}
