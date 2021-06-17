class Tournament {
  final int id;
  final String tournamentName;
  final String gameName;
  final String urlImage;

  const Tournament({
    required this.id,
    required this.tournamentName,
    required this.gameName,
    required this.urlImage,
  });

  factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
        id: json['id'],
        tournamentName: json['tournamentName'],
        gameName: json['gameName'],
        urlImage: json['urlImage'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': tournamentName,
        'author': gameName,
        'urlImage': urlImage,
      };
}
