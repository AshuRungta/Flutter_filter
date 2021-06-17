import 'package:filter_listview_example/data/tournaments_data.dart';
import 'package:filter_listview_example/main.dart';
import 'package:filter_listview_example/model/tournament.dart';
import 'package:filter_listview_example/widget/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class FilterLocalListPage extends StatefulWidget {
  @override
  FilterLocalListPageState createState() => FilterLocalListPageState();
}

class FilterLocalListPageState extends State<FilterLocalListPage> {
  late List<Tournament> tournaments;
  String query = '';

  @override
  void initState() {
    super.initState();

    tournaments = alltournaments;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: ExpansionTileCard(
                baseColor: Colors.purple,
                expandedColor: Colors.deepPurple,
                leading: Image.asset(
                  "assests/wpvalo.jpg",
                  height: 90,
                  width: 90,
                ),
                title: Text(
                  "VCT MASTERS",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  "VALORANT",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                children: <Widget>[
                  Divider(
                    thickness: 1.0,
                    height: 1.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Container(
                        height: 165,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Text(
                              'The valorant champions tour is beginning for NA in which top team will compete to book an slot for the world champions...',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Duration; 9 to 11 july',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'prize pool: 500',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Tier: S',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Tournament mode: Online',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.end,
                    buttonHeight: 52.0,
                    buttonMinWidth: 90.0,
                    children: <Widget>[
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0)),
                        onPressed: () {
                          //     cardA.currentState?.expand();
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                            ),
                            Text(
                              'Open',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Title or Author Name',
        onChanged: searchBook,
      );

  Widget buildBook(Tournament tournament) => ListTile(
        leading: Image.network(
          tournament.urlImage,
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        title: Text(tournament.tournamentName),
        subtitle: Text(tournament.gameName),
      );

  void searchBook(String query) {
    final tournaments = alltournaments.where((tournament) {
      final tournamentnameLower = tournament.tournamentName.toLowerCase();
      final gamenameLower = tournament.gameName.toLowerCase();
      final searchLower = query.toLowerCase();

      return tournamentnameLower.contains(searchLower) ||
          gamenameLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.tournaments = tournaments;
    });
  }
}
