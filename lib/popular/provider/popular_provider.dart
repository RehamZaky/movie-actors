import 'package:flutter/material.dart';
import 'package:flutter_assessment_task/main.dart';
import 'package:flutter_assessment_task/popular/data/models/popular.dart';
import 'package:flutter_assessment_task/popular/data/repos/popular_repo.dart';
import 'package:flutter_assessment_task/shared/di.dart';

class PopularPeopleProvider extends ChangeNotifier {
  List<Popular> popularPeople = [];
  List<String> moviesTitle = [];
  int pageNo = 1;

  Future<List<Popular>> getPopularPeople() async {
    final popularRepo = di.get<PopularRepo>();

    var popular = await popularRepo.getPopularPeople(page: pageNo);
    if (popular is List<Popular>) {
      popularPeople = popular;
      for (var element in popularPeople) {
        for (var movie in element.knownFor) {
          if (element.moviesTitle.isEmpty) {
            element.moviesTitle = movie.title ?? movie.name!;
          } else {
            element.moviesTitle +=
                movie.title != null ? ', ${movie.title}' : ', ${movie.name}';
          }
        }
      }
    } else {
      showAlertDialog(navigatorKey.currentContext!);
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

  Future<void> onRefresh() async {
    await getPopularPeople();
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

  @override
  void dispose() {
    moviesTitle = [];
    super.dispose();
  }
}
