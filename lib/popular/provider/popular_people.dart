import 'package:flutter/material.dart';
import 'package:flutter_assessment_task/popular/data/models/popular.dart';
import 'package:flutter_assessment_task/popular/data/repos/popular_repo.dart';
import 'package:flutter_assessment_task/shared/di.dart';

class PopularPeopleProvider extends ChangeNotifier {
  List<Popular> popularPeople = [];
  int pageNo = 1;

  Future<List<Popular>> getPopularPeople() async {
    final popularRepo = di.get<PopularRepo>();

    var popular = await popularRepo.getPopularPeople(page: pageNo);
    if (popular is List<Popular>) {
      popularPeople = popular;
    } else {
      // TODO: show dialog or snackBar
    }

    // notifyListeners();
    return popularPeople;
  }

  void updatePageNo() async {
    pageNo++;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    await getPopularPeople();
  }
}
