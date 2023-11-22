import 'package:flutter_assessment_task/popular/data/models/popular.dart';
import 'package:flutter_assessment_task/shared/style/constants.dart';
import 'package:tmdb_api/tmdb_api.dart';

class PopularRepo {
  List<Popular> popularPeople = [];

  Future<dynamic> getPopularPeople({required int page}) async {
    try {
      TMDB tmdb = TMDB(
        ApiKeys(apiKey, apiAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true),
      );

      Map popularSSS =
          await tmdb.v3.people.getPopular(language: 'en-US', page: page);
      final decoded = popularSSS['results'];

      decoded.forEach((json) => popularPeople.add(Popular.fromJson(json)));

      return popularPeople;
    } catch (e) {
      return e.toString();
    }
  }
}
