import 'package:flutter_assessment_task/images/data/models/profile_images.dart';
import 'package:flutter_assessment_task/shared/style/constants.dart';
import 'package:tmdb_api/tmdb_api.dart';

class ImagesRepo {
  List<ProfileImages> profileImages = [];

  Future<dynamic> getPeopleImages({required int personId}) async {
    try {
      profileImages = [];
      TMDB tmdb = TMDB(
        ApiKeys(apiKey, apiAccessToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true),
      );

      Map peopleImages = await tmdb.v3.people.getImages(personId);
      final decoded = peopleImages['profiles'];

      decoded
          .forEach((json) => profileImages.add(ProfileImages.fromJson(json)));

      return profileImages;
    } catch (e) {
      return e.toString();
    }
  }
}
