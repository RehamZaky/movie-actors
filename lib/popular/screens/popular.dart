import 'package:flutter/material.dart';
import 'package:flutter_assessment_task/popular/data/models/popular.dart';
import 'package:flutter_assessment_task/popular/provider/popular_people.dart';
import 'package:flutter_assessment_task/popular/widgets/movie_popular.dart';
import 'package:flutter_assessment_task/shared/data/models/department.dart';
import 'package:flutter_assessment_task/shared/style/global_colors.dart';
import 'package:flutter_assessment_task/shared/widgets/custom_appbar.dart';
import 'package:flutter_assessment_task/shared/widgets/error_widget.dart';
import 'package:provider/provider.dart';

class MoviePopularScreen extends StatefulWidget {
  const MoviePopularScreen({super.key});

  @override
  State<MoviePopularScreen> createState() => _MoviePopularScreenState();
}

class _MoviePopularScreenState extends State<MoviePopularScreen> {
  // Get a list of people ordered by popularity

  Future<List<Popular>> getPopulars() async {
    return Provider.of<PopularPeopleProvider>(context).getPopularPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Movie popular'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<List<Popular>>(
          future: getPopulars(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                    child: CircularProgressIndicator(
                  color: GlobalColors.backgroundColor,
                ));
              default:
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      if (index == snapshot.data!.length - 1) {
                        Provider.of<PopularPeopleProvider>(context)
                            .updatePageNo();
                      }

                      final onePopular = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: MoviePopularWidget(onePopular: onePopular),
                      );
                    }),
                  );
                } else {
                  return const CustomErrorWidget();
                }
            }
          },
        ),
      ),
    );
  }
}
