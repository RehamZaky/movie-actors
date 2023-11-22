import 'package:flutter/material.dart';
import 'package:flutter_assessment_task/photos/screens/photo_details.dart';

class PopularImageWidget extends StatelessWidget {
  const PopularImageWidget({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PhotoDetailsScreen(index: index),
        ),
      ),
      // TODO: Replace with popular People Images
      child: Hero(
        tag: 'image$index',
        child: const FlutterLogo(
          size: 30,
        ),
      ),
    );
  }
}
