import 'package:flutter/material.dart';
import 'package:flutter_assessment_task/popular/data/models/popular.dart';
import 'package:flutter_assessment_task/popular_details/provider/person_details.dart';
import 'package:flutter_assessment_task/popular_details/screens/details_screen.dart';
import 'package:flutter_assessment_task/shared/data/models/department.dart';
import 'package:provider/provider.dart';

class MoviePopularWidget extends StatelessWidget {
  const MoviePopularWidget({
    super.key,
    required this.onePopular,
  });

  final Popular onePopular;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<PopularDetailsProvider>(context, listen: false)
            .updatePersonId(onePopular.id);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const PersonDetailsScreen()),
          ),
        );
      },
      child: Card(
        color: Colors.blue.shade100,
        elevation: 1,
        child: Container(
          height: 120,
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                  'https://image.tmdb.org/t/p/w500${onePopular.profilePath}',
                  height: 100),
              const SizedBox(
                width: 16,
              ),
              Column(
                children: [
                  Text(
                    onePopular.name,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                      onePopular.knownForDepartment == KnownForDepartment.ACTING
                          ? 'Acting'
                          : 'VISUAL EFFECTS',
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


// //ListTile(
//           title: Text(onePopular.name),
//           subtitle: Text(
//               onePopular.knownForDepartment == KnownForDepartment.ACTING
//                   ? 'Acting'
//                   : 'VISUAL EFFECTS'),
//           leading: Image.network(
//               'https://image.tmdb.org/t/p/w500${onePopular.profilePath}',
//               height: 170),
//         )
