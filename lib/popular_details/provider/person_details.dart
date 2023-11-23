import 'package:flutter/material.dart';
import 'package:flutter_assessment_task/images/provider/images_provider.dart';
import 'package:flutter_assessment_task/main.dart';
import 'package:flutter_assessment_task/popular_details/data/models/popular_details.dart';
import 'package:flutter_assessment_task/popular_details/data/repos/details_repo.dart';
import 'package:flutter_assessment_task/shared/di.dart';
import 'package:provider/provider.dart';

class PopularDetailsProvider extends ChangeNotifier {
  PopularDetails? popularDetails;
  int? personId;

  getPopularDetails() async {
    final detailsRepo = di.get<PopularDetailsRepo>();

    var details = await detailsRepo.getPopularDetails(personId: personId!);
    if (details is PopularDetails) {
      popularDetails = details;
    } else {
      // TODO: show dialog or snackBar
    }
    notifyListeners();
  }

  void updatePersonId(int id) async {
    personId = id;
    clearDetails();
    await getPopularDetails();
    Provider.of<ProfileImagesProvider>(navigatorKey.currentContext!,
            listen: false)
        .getProfileImages(id);
  }

  void clearDetails() {
    popularDetails = null;
  }
}
