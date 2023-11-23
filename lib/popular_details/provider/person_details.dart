import 'package:flutter/material.dart';
import 'package:flutter_assessment_task/popular_details/data/models/popular_details.dart';
import 'package:flutter_assessment_task/popular_details/data/repos/details_repo.dart';
import 'package:flutter_assessment_task/shared/di.dart';

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
    await getPopularDetails();
  }
}
