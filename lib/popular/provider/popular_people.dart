import 'package:flutter/material.dart';
import 'package:flutter_assessment_task/popular/data/models/popular.dart';
import 'package:flutter_assessment_task/shared/data/models/department.dart';

class PopularPeople extends ChangeNotifier {
  List<Popular> popular = [];

  List<Popular> getPopularPeople() {

    popular = List.generate(
      300,
      (index) => Popular(
        adult: false,
        gender: 1,
        id: 4068148,
        knownForDepartment: KnownForDepartment.ACTING,
        name: "Madeleine Yuna Voyles",
        originalName: "Madeleine Yuna Voyles",
        popularity: 249.806 + index,
        profilePath: "/mLKvNuCJSgyK0WdLd4ogO81sOO1.jpg",
        knownFor: [],
      ),
    );

    return popular;
    //  notifyListeners();
  }
}
