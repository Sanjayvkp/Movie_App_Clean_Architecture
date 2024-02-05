import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
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
                }
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: ref.watch(imageUrlProvider).isEmpty
                    ? NetworkImage(
                        FirebaseAuth.instance.currentUser!.photoURL.toString())
                    : NetworkImage(ref.watch(imageUrlProvider)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width / 1.1,
              height: 60,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 215, 214, 214),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                FirebaseAuth.instance.currentUser!.displayName!,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              )),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width / 1.1,
              height: 60,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 215, 214, 214),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                '${FirebaseAuth.instance.currentUser!.email!}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              )),
            ),
          ],
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
