import 'package:flutter/material.dart';
import 'package:flutter_assessment_task/popular_details/provider/person_details.dart';
import 'package:flutter_assessment_task/popular_details/widgets/custom_wrap.dart';
import 'package:flutter_assessment_task/popular_details/widgets/images_grid.dart';
import 'package:flutter_assessment_task/popular_details/widgets/popular_image.dart';
import 'package:flutter_assessment_task/shared/style/constants.dart';
import 'package:flutter_assessment_task/shared/style/global_colors.dart';
import 'package:flutter_assessment_task/shared/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class PersonDetailsScreen extends StatefulWidget {
  const PersonDetailsScreen({super.key});

  @override
  State<PersonDetailsScreen> createState() => _PersonDetailsScreenState();
}

class _PersonDetailsScreenState extends State<PersonDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final headerTheme = Theme.of(context).textTheme.titleLarge!.copyWith(
        fontWeight: FontWeight.bold, color: GlobalColors.backgroundColor);
    return Scaffold(
      appBar: const CustomAppBar(title: ''),
      body: Consumer<PopularDetailsProvider>(
        child: const SizedBox(),
        builder: (context, details, child) {
          if (details.popularDetails == null) {
            return const Center(
              child: CircularProgressIndicator(
                  color: GlobalColors.backgroundColor),
            );
          } else {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.network(
                          '$baseImageUrl${details.popularDetails!.profilePath}',
                          height: 250,
                          width: MediaQuery.sizeOf(context).width / 3,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                details.popularDetails!.name,
                                style: headerTheme,
                              ),
                              CustomRowInfo(
                                  textVal: details.popularDetails!.biography,
                                  title: 'Biography'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      //  mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Personal Info',
                          style: headerTheme,
                        ),
                        CustomRowInfo(
                            textVal: details.popularDetails!.knownForDepartment,
                            title: 'known for'),
                        CustomRowInfo(
                            textVal: details.popularDetails!.gender == 2
                                ? 'male'
                                : 'female',
                            title: 'Gender'),
                        CustomRowInfo(
                            textVal: details.popularDetails!.birthday,
                            title: 'Birthday'),
                        CustomRowInfo(
                            textVal: details.popularDetails!.placeOfBirth,
                            title: 'Place of Birth'),
                        const SizedBox(
                          height: 12,
                        ),
                        const SizedBox(
                          child: ImagesGridView(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
