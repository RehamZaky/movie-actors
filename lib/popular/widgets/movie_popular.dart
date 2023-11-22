import 'package:flutter/material.dart';
import 'package:flutter_assessment_task/popular/data/models/popular.dart';
import 'package:flutter_assessment_task/popular_details/screens/details_screen.dart';
import 'package:flutter_assessment_task/shared/data/models/department.dart';

class MoviePopularWidget extends StatelessWidget {
  const MoviePopularWidget({
    super.key,
    required this.onePopular,
  });

  final Popular onePopular;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => const PersonDetailsScreen()),
        ),
      ),
      child: Card(
        color: Colors.blue.shade100,
        elevation: 1,
        child: ListTile(
          title: Text(onePopular.name),
          subtitle: Text(
              onePopular.knownForDepartment == KnownForDepartment.ACTING
                  ? 'Acting'
                  : 'VISUAL_EFFECTS'),
        ),
      ),
    );
  }
}
