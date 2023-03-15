import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sento_staff/models/player.dart';
import 'package:sento_staff/services/player_service.dart';
import 'package:sento_staff/widgets/default_app_bar.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  List<Player> _players = [Player.placeholder()];
  String _sortBy = "xp";
  int _page = 1;
  void Function() _onPressed(page) {
    void onPressed() {
      if (page == _page) return;
      PlayerService().getAllPlayers(_sortBy, page).then(
        (List<Player> players) {
          setState(() {
            _players = players;
            _page = page;
          });
        },
      );
    }

    return onPressed;
  }

  @override
  void initState() {
    super.initState();
    PlayerService().getAllPlayers(_sortBy, _page).then(
      (List<Player> players) {
        setState(() {
          _players = players;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: defaultAppBar(context, title: "Leaderboard"),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 90, 38, 107),
                    foregroundColor: Colors.red,
                  ),
                  onPressed: () {
                    if (_sortBy != "balance") {
                      PlayerService().getAllPlayers(_sortBy, _page).then(
                        (List<Player> players) {
                          setState(() {
                            _players = players;
                            _sortBy = "balance";
                          });
                        },
                      );
                    }
                  },
                  child: Text("XP",
                      style: TextStyle(
                          color: Color.fromARGB(255, 253, 192, 107),
                          fontFamily: "Unbounded"))),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 90, 38, 107),
                      foregroundColor: Colors.red,
                    ),
                    onPressed: () {
                      if (_sortBy != "xp") {
                        PlayerService().getAllPlayers(_sortBy, _page).then(
                          (List<Player> players) {
                            setState(() {
                              _players = players;
                              _sortBy = "xp";
                            });
                          },
                        );
                      }
                    },
                    child: Text("Kin",
                        style: TextStyle(
                            color: Color.fromARGB(255, 253, 192, 107),
                            fontFamily: "Unbounded"))),
              )
            ],
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final player = _players[index];
                    return ListTile(
                        leading:
                            Text(((_page - 1) * 10 + index + 1).toString()),
                        title: Text(player.name),
                        subtitle: Text("ID: ${player.id}"),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "Kin: 金 ${NumberFormat.currency(symbol: '', decimalDigits: 0).format(player.balance)}"),
                            Text("XP: ${player.xp}")
                          ],
                        ));
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: _players.length)),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _generatePageButtons())
        ]));
  }

  List<PageButton> _generatePageButtons() {
    List<PageButton> buttons = [];
    if (_page != 1) {
      buttons.add(PageButton(1, _onPressed(1)));
      if (_page - 1 != 1) {
        buttons.add(PageButton(_page - 1, _onPressed(_page - 1)));
      }
    }
    buttons.add(PageButton(
      _page,
      _onPressed(_page),
      selected: true,
    ));
    if (_page != 70) {
      buttons.add(PageButton(_page + 1, _onPressed(_page + 1)));
      if (_page + 1 != 70) {
        buttons.add(PageButton(70, _onPressed(70)));
      }
    }
    return buttons;
  }
}

class PageButton extends StatelessWidget {
  const PageButton(this.page, this.onPressed, {super.key, this.selected});
  final void Function() onPressed;
  final int page;
  final bool? selected;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: Color.fromARGB(255, 90, 38, 107),
          foregroundColor: Colors.red,
        ),
        child: Text(page.toString(),
            style: TextStyle(
                color: Color.fromARGB(255, 253, 192, 107),
                fontFamily: "Unbounded")));
  }
}
