import 'package:flutter_assessment_task/popular/data/models/popular_for.dart';
import 'package:flutter_assessment_task/shared/data/models/department.dart';

class Popular {
 late bool adult;
 late int gender;
 late int id;
 late KnownForDepartment knownForDepartment;
 late String name;
 late String originalName;
 late double popularity;
 late String profilePath;
 late List<KnownFor> knownFor;

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

  Popular.fromJson(dynamic json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['knownForDepartment'];
    name = json['name'];
    originalName = json['originalName'];
    popularity = json['popularity'];
    profilePath = json['profilePath'];
    knownFor = json['knownFor'];
  }
}
