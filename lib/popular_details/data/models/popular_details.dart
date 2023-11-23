class PopularDetails {
  late bool adult;
  late List<String> alsoKnownAs;
  late String biography;
  late String birthday;
  dynamic deathday;
  late int gender;
  dynamic homepage;
  late int id;
  late String imdbId;
  late String knownForDepartment;
  late String name;
  late String placeOfBirth;
  late double popularity;
  late String profilePath;

  PopularDetails({
    required this.adult,
    required this.alsoKnownAs,
    required this.biography,
    required this.birthday,
    this.deathday,
    required this.gender,
    this.homepage,
    required this.id,
    required this.imdbId,
    required this.knownForDepartment,
    required this.name,
    required this.placeOfBirth,
    required this.popularity,
    required this.profilePath,
  });

  PopularDetails.fromJson(dynamic json) {
    adult = json["adult"];
    //  alsoKnownAs = json["also_known_as"];   //TODO:change
    biography = json['biography'];
    birthday = json['birthday'];
    gender = json['gender'];
    deathday = json['deathday'];
    homepage = json['homepage'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    placeOfBirth = json['place_of_birth'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
  }
}
