import 'package:flutter/material.dart';
import 'package:flutter_assessment_task/shared/widgets/custom_appbar.dart';
import 'package:lottie/lottie.dart';

class PhotoDetailsScreen extends StatelessWidget {
  const PhotoDetailsScreen({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '',
        actions: [
          IconButton(
            onPressed: () {},
            icon: Lottie.asset('assets/lottie/download.json'),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Hero(
          tag: 'image$index',
          child: const FlutterLogo(
            size: 200,
          ),
        ),
      ),
    );
  }
}
