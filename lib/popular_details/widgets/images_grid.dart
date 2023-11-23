import 'package:flutter/material.dart';
import 'package:flutter_assessment_task/images/provider/images_provider.dart';
import 'package:flutter_assessment_task/popular_details/widgets/popular_image.dart';
import 'package:flutter_assessment_task/shared/style/global_colors.dart';
import 'package:provider/provider.dart';

class ImagesGridView extends StatelessWidget {
  const ImagesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileImagesProvider>(
        child: const SizedBox(),
        builder: (context, details, child) {
          if (details.profileImages.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                  color: GlobalColors.backgroundColor),
            );
          } else {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5,crossAxisSpacing: 5,
                  crossAxisCount: 3),
              scrollDirection: Axis.vertical,
              
              itemCount: details.profileImages.length,
              itemBuilder: ((context, index) {
                return PopularImageWidget(index: index);
              }),
            );
          }
        },);
  }
}
