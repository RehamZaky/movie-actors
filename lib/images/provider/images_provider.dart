import 'package:flutter/material.dart';
import 'package:flutter_assessment_task/images/data/models/profile_images.dart';
import 'package:flutter_assessment_task/images/data/repos/images_repo.dart';
import 'package:flutter_assessment_task/main.dart';
import 'package:flutter_assessment_task/shared/di.dart';

class ProfileImagesProvider extends ChangeNotifier {
  List<ProfileImages> profileImages = [];
  int? personId;
  ProfileImages? selectedImage;

  getProfileImages(int personId) async {
    profileImages = [];
    final imagesRepo = di.get<ImagesRepo>();

    personId = personId;
    var images = await imagesRepo.getPeopleImages(personId: personId);
    if (images is List<ProfileImages>) {
      profileImages = images;
    } else {
      showAlertDialog(navigatorKey.currentContext!);
    }

    notifyListeners();
  }

  void selectImage(int index) {
    selectedImage = profileImages[index];
    notifyListeners();
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('An error occurred'),
        content: const Text("An error occurred, Please try again"),
        actions: [
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('ok'),
          ),
        ],
      ),
    );
  }
}
