import 'dart:convert';
import 'package:filter_listview_example/model/tournament.dart';
import 'package:http/http.dart' as http;

class BooksApi {
  static Future<List<Tournament>> getBooks(String query) async {
    final url = Uri.parse(
        'https://gist.githubusercontent.com/JohannesMilke/d53fbbe9a1b7e7ca2645db13b995dc6f/raw/eace0e20f86cdde3352b2d92f699b6e9dedd8c70/books.json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List tournament = json.decode(response.body);

      return tournament
          .map((json) => Tournament.fromJson(json))
          .where((tournament) {
        final tournamentnameLower = tournament.tournamentName.toLowerCase();
        final gamenameLower = tournament.gameName.toLowerCase();
        final searchLower = query.toLowerCase();

        return tournamentnameLower.contains(searchLower) ||
            gamenameLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
