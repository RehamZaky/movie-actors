
import 'package:flutter_assessment_task/popular/data/models/popular_for.dart';
import 'package:flutter_assessment_task/shared/data/models/department.dart';

class Popular {
    bool adult;
    int gender;
    int id;
    KnownForDepartment knownForDepartment;
    String name;
    String originalName;
    double popularity;
    String profilePath;
    List<KnownFor> knownFor;

    Popular({
        required this.adult,
        required this.gender,
        required this.id,
        required this.knownForDepartment,
        required this.name,
        required this.originalName,
        required this.popularity,
        required this.profilePath,
        required this.knownFor,
    });

}


