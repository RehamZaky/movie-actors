import 'package:flutter_assessment_task/popular_details/data/models/popular_details.dart';
import 'package:flutter_assessment_task/shared/style/constants.dart';
import 'package:tmdb_api/tmdb_api.dart';

class PopularDetailsRepo {
  PopularDetails? popularDetails;

  Future<dynamic> getPopularDetails({required int personId}) async {
    try {
      TMDB tmdb = TMDB(
        ApiKeys(apiKey, apiAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true),
      );

      Map decoded =
          await tmdb.v3.people.getDetails(personId, language: 'en-US');

      popularDetails = PopularDetails.fromJson(decoded);

      return popularDetails;
    } catch (e) {
      return e.toString();
    }
  }
}
