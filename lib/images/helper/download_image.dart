import 'dart:io';

import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

String fileName = 'image.jpg';

void openFile(String url) async {
  final file = await downloadFile(url);
  if (file == null) return;

  OpenFile.open(file.path);
}

Future<File?> downloadFile(String url) async {
  try {
    final response = await Dio().get(url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
        ));

    File file = File(await getDirectory());
    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();
    return file;
  } catch (e) {
    return null;
  }
}

Future<String> getDirectory() async {
  final directory = await getDownloadsDirectory();
  return '${directory!.path}/$fileName';
}
