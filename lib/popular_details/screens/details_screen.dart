import 'package:flutter/material.dart';
import 'package:flutter_assessment_task/popular_details/widgets/popular_image.dart';
import 'package:flutter_assessment_task/shared/style/global_colors.dart';
import 'package:flutter_assessment_task/shared/widgets/custom_appbar.dart';

class PersonDetailsScreen extends StatefulWidget {
  const PersonDetailsScreen({super.key});

  @override
  State<PersonDetailsScreen> createState() => _PersonDetailsScreenState();
}

class _PersonDetailsScreenState extends State<PersonDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: ''),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'hello',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: GlobalColors.backgroundColor),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.6,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                scrollDirection: Axis.vertical,
                itemCount: 50,
                itemBuilder: ((context, index) {
                  return PopularImageWidget(index: index);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

