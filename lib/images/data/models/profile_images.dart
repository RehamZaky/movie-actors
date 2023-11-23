class ProfileImages {
  late double aspectRatio;
  late int height;
  dynamic iso6391;
  late String filePath;
  late double voteAverage;
  late int voteCount;
  late int width;

  ProfileImages({
    required this.aspectRatio,
    required this.height,
    this.iso6391,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  ProfileImages.fromJson(dynamic json) {
    aspectRatio = json['aspect_ratio'];
    height = json['height'];
    iso6391 = json['iso_639_1'];
    filePath = json['file_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
  }
}
