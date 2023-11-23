import 'package:flutter/material.dart';
import 'package:flutter_assessment_task/images/helper/download_helper.dart';
import 'package:flutter_assessment_task/images/provider/images_provider.dart';
import 'package:flutter_assessment_task/popular_details/provider/person_details.dart';
import 'package:flutter_assessment_task/shared/style/constants.dart';
import 'package:flutter_assessment_task/shared/widgets/custom_appbar.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class PhotoDetailsScreen extends StatelessWidget {
  const PhotoDetailsScreen({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ProfileImagesProvider>(context);
    final url = '$baseImageUrl${imageProvider.selectedImage!.filePath}';

    return Scaffold(
      appBar: CustomAppBar(
        title:
            Provider.of<PopularDetailsProvider>(context).popularDetails!.name,
        actions: [
          IconButton(
            onPressed: () {
              DownloadHelper.openFile(url);
            },
            icon: Lottie.asset('assets/lottie/download.json'),
          ),
        ],
      ),
      body: Container(
          margin: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Hero(
            tag: 'image$index',
            child: Image.network(
              url,
              width: double.tryParse(
                  imageProvider.selectedImage!.width.toString()),
              height: double.tryParse(
                  imageProvider.selectedImage!.height.toString()),
            ),
          )),
    );
  }
}
