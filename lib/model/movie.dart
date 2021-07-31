class Movie {
  final String id;
  final String name;
  final String imageUrl;
  final String score;

  Movie(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.score});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json["imdbID"] as String,
        name: json["Title"] as String,
        imageUrl: json["Poster"] as String,
        score: '7.8' ) ;
  }
}
