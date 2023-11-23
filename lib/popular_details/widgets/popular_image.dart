import 'package:flutter/material.dart';
import 'package:flutter_assessment_task/images/provider/images_provider.dart';
import 'package:flutter_assessment_task/images/screens/photo_details.dart';
import 'package:flutter_assessment_task/shared/style/constants.dart';
import 'package:provider/provider.dart';

class PopularImageWidget extends StatelessWidget {
  const PopularImageWidget({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ProfileImagesProvider>(context);
    return GestureDetector(
      onTap: () {
        Provider.of<ProfileImagesProvider>(context, listen: false)
            .selectImage(index);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhotoDetailsScreen(index: index),
          ),
        );
      },
      child: Hero(
        tag: 'image$index',
        child: AspectRatio(
          aspectRatio: imageProvider.profileImages[index].aspectRatio,
          child: Image.network('$baseImageUrl${imageProvider.profileImages[index].filePath}')),
      ),
    );
  }
}
