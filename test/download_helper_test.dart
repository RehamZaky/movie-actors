import 'dart:io';

import 'package:flutter_assessment_task/images/helper/download_helper.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' as p;

void main() {
  String url =
      'https://image.tmdb.org/t/p/w500/5z5cllrNv8LV09iiozBf344jG23.jpg';

  group('download files', () {
    test('download image file', () async {
      final file = await DownloadHelper.downloadFile(url);

      expect(file, null);
      // expect(p.extension(file!.path), 'jpg');
    });
  });
}
