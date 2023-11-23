import 'dart:io';

import 'package:flutter_assessment_task/popular_details/data/models/popular_details.dart';
import 'package:flutter_assessment_task/popular_details/data/repos/details_repo.dart';
import 'package:flutter_assessment_task/popular_details/provider/person_details.dart';
import 'package:flutter_assessment_task/shared/di.dart';
import 'package:provider/provider.dart';
import 'package:test/test.dart';

void main() {
  group('people details', () {
    test('get details provider', () async {
      di.registerLazySingleton(() => PopularDetailsRepo());

      final provider = PopularDetailsProvider();
      provider.personId = 2359226;
      final details = await provider.getPopularDetails();

      expect(details, PopularDetails);
    });
  });
}
